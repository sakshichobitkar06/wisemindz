import sCode from "../../custom/status-codes";
const { ok, created, bad_request, server_error } = sCode;

import {
    getValidationErrMsg,
    getIdNotFoundCommonMsg,
    getServerErrorMsg,
} from '../../custom/error-msg';

// models import here
import model from '../../db/models';
const { Student, Class, Subject, Exam, Section, School } = model;

// validation import here
import validateStudent from '../../requests/studentRequest';

export default {

    async getStudentDs(req, res) {
        try {
            const classes = await Class.getDS();
            const subjects = await Subject.getDS();
            const exams = await Exam.getDS();
            const sections = await Section.getDS();
            const school = await School.getDS();
            res.status(ok).send({ classes, subjects, exams, sections, school });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getStudents(req, res) {
        try {
            const students = await Student.getList();
            res.status(ok).send({ students });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);

        }
    },

    async getSubjectClassWise(req, res) {
        try {
            const students = await Student.getListClassWise();
            res.status(ok).send({ students });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);

        }
    },

    async addStudent(req, res) {
        try {
            const { error } = validateStudent(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });
            const student = await Student.saveRecord(req.body);
            if (!student) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ student });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async importStudent(req, res) {
        try {
            let err = false
            let ee = []
            await req.body.map((v) => {
                const {error}  = validateStudent(v)
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

            const addStudent = await Student.saveMultipleRecord(req.body);

            if (!addStudent) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ addStudent });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getStudent(req, res) {
        try {
            const { id } = req.params;
            const recordExist = await Student.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('student') });
            res.status(ok).send({ student: recordExist });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async updateStudent(req, res) {
        try {
            const { error } = validateStudent(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });

            const { id } = req.params;
            let recordExist = await Student.getRecordByOnlyId(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('student') });

            const student = await Student.updateRecord( recordExist, req.body );
            if (!student) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ student });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async deleteStudent(req, res) {
        try {
            const { id } = req.params;
            let recordExist = await Student.getRecordByDeleteId(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('student') });

            const student = await Student.deleteRecord( recordExist );
            if (!student) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(ok).send({ student });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    }
}