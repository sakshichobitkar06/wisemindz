import Joi from '@hapi/joi';

export default (requestData, id = 0) => {
    const schema = Joi.object({
        level_name: Joi.string().required().messages({
            'string.base' : `level_name should be a type of 'text'`,
            'string.empty': `level_name cannot be an empty field`,
            'any.required': `level_name is a required field`
        }),
        class_id: Joi.number().min(1).required().messages({
            'number.base' : `class_id should be a type of 'number'`,
            'number.empty': `class_id cannot be an empty field`,
            'number.min'  : `class_id length must be at least 1 characters`,
            'any.required': `class_id is a required field`
        })
    });
    return schema.validate(requestData, {abortEarly: false});
}