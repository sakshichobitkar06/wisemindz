import Joi from '@hapi/joi';

export default (requestData, id = 0) => {
    const schema = Joi.object({
        subject_id: Joi.number().min(1).required().messages({
            'number.base' : `subject_id should be a type of 'number'`,
            'number.empty': `subject_id cannot be an empty field`,
            'number.min'  : `subject_id length must be at least 1 characters`,
            'any.required': `subject_id is a required field`
        }),
        game_name: Joi.string().required().messages({
            'string.base' : `game_name should be a type of 'text'`,
            'string.empty': `game_name cannot be an empty field`,
            'any.required': `game_name is a required field`
        }),
        game_topic: Joi.string().required().messages({
            'string.base' : `game_topic should be a type of 'text'`,
            'string.empty': `game_topic cannot be an empty field`,
            'any.required': `game_topic is a required field`
        }),
        class_id: Joi.number().min(1).required().messages({
            'number.base' : `class_id should be a type of 'number'`,
            'number.empty': `class_id cannot be an empty field`,
            'number.min'  : `class_id length must be at least 1 characters`,
            'any.required': `class_id is a required field`
        }),
        level_id: Joi.number().min(1).required().messages({
            'number.base' : `level_id should be a type of 'number'`,
            'number.empty': `level_id cannot be an empty field`,
            'number.min'  : `level_id length must be at least 1 characters`,
            'any.required': `level_id is a required field`
        }),
        game_type: Joi.string().required().messages({
            'string.base' : `game_type should be a type of 'text'`,
            'string.empty': `game_type cannot be an empty field`,
            'any.required': `game_type is a required field`
        }),
        google: Joi.string().allow('').required().messages({
            'string.base' : `google link should be a type of 'text'`,
            'string.empty': `google link cannot be an empty field`,
            'any.required': `google link is a required field`
        }),
        youtube: Joi.string().allow('').required().messages({
            'string.base' : `youtube link should be a type of 'text'`,
            'string.empty': `youtube link cannot be an empty field`,
            'any.required': `youtube link is a required field`
        }),
        file1: Joi.string().allow('').messages({
            'string.base': `file1 should be a type of 'text'`,
            'string.empty': `file1 cannot be an empty field`,
            'any.required': `file1 is a required field`
        }),
        file2: Joi.string().allow('').messages({
            'string.base': `file2 should be a type of 'text'`,
            'string.empty': `file2 cannot be an empty field`,
            'any.required': `file2 is a required field`
        }),
        file3: Joi.string().allow('').messages({
            'string.base': `file3 should be a type of 'text'`,
            'string.empty': `file3 cannot be an empty field`,
            'any.required': `file3 is a required field`
        }),
    });
    return schema.validate(requestData, {abortEarly: false});
}