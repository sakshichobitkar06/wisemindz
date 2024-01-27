import sCode from "../../../custom/status-codes";
const { ok, created, bad_request, server_error } = sCode;

import {
    getValidationErrMsg,
    getIdNotFoundCommonMsg,
    getServerErrorMsg,
} from '../../../custom/error-msg';

// models import here
import model from '../../../db/models';
const { Question, Subject, Class, Exam } = model;

// validation import here
import validateQuestion from '../../../requests/questionRequest';

export default {
    async getQuestionDS(req, res) {
        try {
            const classes = await Class.getDS();
            const subjects = await Subject.getDS();
            const exams = await Exam.getDS();
            res.status(ok).send({ classes, subjects, exams });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getQuestions(req, res) {
        try {
            const questions = await Question.getList();
            res.status(ok).send({ questions });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);

        }
    },

    async addQuestion(req, res) {
        try {
            const { error } = validateQuestion(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });
            const question = await Question.saveRecord(req.body);
            if (!question) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ question });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async importQuestion(req, res) {
        try {
            let err = false
            let ee = []
            await req.body.map((v) => {
                const {error}  = validateQuestion(v)
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

            const addQuestion = await Question.saveMultipleRecord(req.body);

            if (!addQuestion) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ addQuestion });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getQuestion(req, res) {
        try {
            const { id } = req.params;
            const recordExist = await Question.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('question') });
            res.status(ok).send({ question: recordExist });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getQuestionByExam(req, res) {
        try {
            const { exam_id } = req.params;
            const recordExist = await Question.getRecordByExamId(exam_id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('question') });
            res.status(ok).send({ question: recordExist });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },
    
    async getFilteredQuestionsById(req, res) {
        try {
            const { class_id, subject_id,exam_id, exam_Question } = req.params;
            const recordExist = await Question.getFilteredQuestions(class_id,subject_id,exam_id,exam_Question );
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('question') });
            res.status(ok).send({ question: recordExist });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async updateQuestion(req, res) {
        try {
            const { error } = validateQuestion(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });

            const { id } = req.params;
            let recordExist = await Question.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('question') });

            const question = await Question.updateRecord( recordExist, req.body );
            if (!question) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ question });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async deleteQuestion(req, res) {
        try {
            const { id } = req.params;
            let recordExist = await Question.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('question') });

            const question = await Question.deleteRecord( recordExist );
            if (!question) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(ok).send({ question });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    }
}


