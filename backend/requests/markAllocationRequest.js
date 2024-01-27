import Joi from '@hapi/joi';

export default (requestData, id = 0) => {
    const schema = Joi.object({
        student_id: Joi.number().min(1).messages({
            'number.base' : `student_id should be a type of 'number'`,
            'number.empty': `student_id cannot be an empty field`,
            'number.min'  : `student_id length must be at least 1 characters`,
            'any.required': `student_id is a required field`
        }),
        class_id: Joi.number().min(1).messages({
            'number.base' : `class_id should be a type of 'number'`,
            'number.empty': `class_id cannot be an empty field`,
            'number.min'  : `class_id length must be at least 1 characters`,
            'any.required': `class_id is a required field`
        }),
        level_id: Joi.number().min(1).messages({
            'number.base' : `level_id should be a type of 'number'`,
            'number.empty': `level_id cannot be an empty field`,
            'number.min'  : `level_id length must be at least 1 characters`,
            'any.required': `level_id is a required field`
        }),
        subject_id: Joi.number().min(1).messages({
            'number.base' : `subject_id should be a type of 'number'`,
            'number.empty': `subject_id cannot be an empty field`,
            'number.min'  : `subject_id length must be at least 1 characters`,
            'any.required': `subject_id is a required field`
        }),
        exam_id: Joi.number().min(1).messages({
            'number.base' : `exam_id should be a type of 'number'`,
            'number.empty': `exam_id cannot be an empty field`,
            'number.min'  : `exam_id length must be at least 1 characters`,
            'any.required': `exam_id is a required field`
        }),
        outoff: Joi.string().messages({
            'string.base' : `outoff should be a type of number`,
            'string.empty': `outoff cannot be an empty field`,
            'any.required': `outoff is a required field`
        }),
        obtain: Joi.string().messages({
            'string.base' : `obtain should be a type of number`,
            'string.empty': `obtain cannot be an empty field`,
            'any.required': `obtain is a required field`
        }),
        sectionA: Joi.string().messages({
            'string.base' : `obtain should be a type of number`,
            'string.empty': `obtain cannot be an empty field`,
            'any.required': `obtain is a required field`
        }),

        sectionB: Joi.string().messages({
            'string.base' : `obtain should be a type of number`,
            'string.empty': `obtain cannot be an empty field`,
            'any.required': `obtain is a required field`
        }),        
        remark: Joi.string().required().messages({
            'string.base' : `remark should be a type of 'text'`,
            'string.empty': `remark cannot be an empty field`,
            'any.required': `remark is a required field`
        }),
        marks: Joi.array().required().messages({
            'object.base' : `marks should be a type of 'object'`,
            'object.empty': `marks cannot be an empty field`,
            'any.required': `marks is a required field`
        }),
    });
    return schema.validate(requestData, {abortEarly: false});
}