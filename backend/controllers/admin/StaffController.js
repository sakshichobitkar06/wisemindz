import sCode from "../../custom/status-codes";
const { ok, created, bad_request, server_error } = sCode;

import {
    getValidationErrMsg,
    getIdNotFoundCommonMsg,
    getServerErrorMsg,
} from '../../custom/error-msg';

// models import here
import model from '../../db/models';
const { Staff, School, Role, Designation } = model;

// validation import here
import validateStaff from '../../requests/staffRequest';

export default {
    async getStaffDs(req, res) {
        try {
            const schools = await School.getDS();
            const roles = await Role.getDS();
            const designations = await Designation.getDS();
            res.status(ok).send({ schools, roles, designations });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getSchoolLevelStaff(req, res) {
        try {
            const { id } = req.params;
            const schools = await School.getRecordById(id);
            const staffs = await Staff.getSchoolLevelList(id);
            res.status(ok).send({ staffs, schools });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getStaffs(req, res) {
        try {
          const staffs = await Staff.getList();
            res.status(ok).send({ staffs });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async addStaff(req, res) {
        try {
            const { error } = validateStaff(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });
            //check email id is already present
            const staffExist = await Staff.checkStaff(req.body);
            if (staffExist) return res.status(bad_request).send({ error: { email_id: " This email has been already used."} });

            const staff = await Staff.saveRecord(req.body);
            if (!staff) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ staff });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async importStaff(req, res) {
        try {
            let err = false
            let ee = []
            await req.body.map((v) => {
                const {error}  = validateStaff(v)
                if (error){
                    ee.push(getValidationErrMsg(error))
                    if(!err){
                        err = true
                    }
                }
            })

            if(err) {
                let val = {}
                ee.map((v) => {
                    val ={...val, ...v}
                })
                return res.status(bad_request).send({ error: val });
            }

            //check email id is already present
            const email = [];
            await Promise.all(req.body.map(async (val) => {
                const StaffExist = await Staff.checkStaff(val);
                if (StaffExist) {
                    email.push(`${val.email_id} email has been already used.`);
                }
            }));

            if (email.length > 0) {
                let val = [];
                email.forEach((v) => {
                    val.push(v)
                });
                return res.status(bad_request).send({ error: val });
            }

            const addStaff = await Staff.saveMultipleRecord(req.body);

            if (!addStaff) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ addStaff });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getStaff(req, res) {
        try {
            const { id } = req.params;
            const recordExist = await Staff.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('staff') });
            res.status(ok).send({ staff: recordExist });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async updateStaff(req, res,) {
        try {
            const { id } = req.params;

            const { error } = validateStaff(req.body, id); 
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });

            let recordExist = await Staff.getRecordById(id); 
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('staff') });
            //validate email already used
            const staffExist = await Staff.checkStaff(req.body);
            if (staffExist !== null && staffExist.id != id) return res.status(bad_request).send({ error: { email_id: " This email has been already used."} });

            const staff = await Staff.updateRecord( recordExist, req.body );
            if (!staff) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ staff});
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async deleteStaff(req, res) {
        try {
            const { id } = req.params;
            let recordExist = await Staff.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('staff') });

            const staff = await Staff.deleteRecord( recordExist );
            if (!staff) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(ok).send({ staff });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    }
}