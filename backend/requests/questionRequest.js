import Joi from '@hapi/joi';

export default (requestData, id = 0) => {
    const schema = Joi.object({
        class_id: Joi.number().min(1).required().messages({
            'number.base' : `class_id should be a type of 'number'`,
            'number.empty': `class_id cannot be an empty field`,
            'number.min'  : `class_id length must be at least 1 characters`,
            'any.required': `class_id is a required field`
        }),
        subject_id: Joi.number().min(1).required().messages({
            'number.base' : `subject_id should be a type of 'number'`,
            'number.empty': `subject_id cannot be an empty field`,
            'number.min'  : `subject_id length must be at least 1 characters`,
            'any.required': `subject_id is a required field`
        }),
        exam_id: Joi.number().min(1).required().messages({
            'number.base' : `exam_id should be a type of 'number'`,
            'number.empty': `exam_id cannot be an empty field`,
            'number.min'  : `exam_id length must be at least 1 characters`,
            'any.required': `exam_id is a required field`
        }),
        exam_section: Joi.string().required().messages({
            'string.base' : `exam_section should be a type of 'text'`,
            'string.empty': `exam_section cannot be an empty field`,
            'any.required': `exam_section is a required field`
        }),
        question_name: Joi.string().required().messages({
            'string.base' : `question should be a type of 'text'`,
            'string.empty': `question cannot be an empty field`,
            'any.required': `question is a required field`
        }),
        optionA: Joi.string().allow('').required().messages({
            'string.base' : `optionA should be a type of 'text'`,
        }),
        optionB: Joi.string().allow('').required().messages({
            'string.base' : `optionB should be a type of 'text'`,
        }),
        optionC: Joi.string().allow('').required().messages({
            'string.base' : `optionC should be a type of 'text'`,
        }),
        optionD: Joi.string().allow('').required().messages({
            'string.base' : `optionD should be a type of 'text'`,
        }),
        correct_option: Joi.allow('').required().messages({
            'string.base' : `correct_option should be a type of 'text'`,
        }),
        mark: Joi.string().required().messages({
            'string.base' : `mark should be a type of 'text'`,
            'string.empty': `mark cannot be an empty field`,
            'any.required': `mark is a required field`
        }),
    });
    return schema.validate(requestData, {abortEarly: false});
}