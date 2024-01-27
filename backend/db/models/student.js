'use strict';
export default (sequelize, DataTypes) => {
	const Student = sequelize.define('Student', {
		id: {
			allowNull: false,
			autoIncrement: true,
			primaryKey: true,
			type: DataTypes.INTEGER
		},
		first_name: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
        middle_name: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
        last_name: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
        roll_no: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
		school_id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        class_id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        section_id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        mobile_no: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
        gender: {
            type: DataTypes.ENUM,
            values: ['male', 'female'],
            allowNull: true,
        },
		status: {
			type: DataTypes.BOOLEAN(true),
			allowNull: true,
			defaultValue: '1'
		},
		created_by: {
		  type: DataTypes.INTEGER(10),
		  allowNull: true,
		},
		updated_by: {
			type: DataTypes.INTEGER(10),
			allowNull: true,
		},
		createdAt: {
			allowNull: false,
			type: DataTypes.DATE
		},
		updatedAt: {
			allowNull: false,
			type: DataTypes.DATE
		}
	}, {
		tableName: 'students'
	});

	Student.associate = function(models) {
		// associations can be defined here
        Student.belongsTo(models.Class, {
            foreignKey: "class_id",
            as: "class",
		});
		Student.belongsTo(models.School, {
            foreignKey: "school_id",
            as: "school",
		});
		Student.belongsTo(models.Exam, {
            foreignKey: "class_id",
            as: "exam",
		});
        Student.belongsTo(models.Section, {
            foreignKey: "section_id",
            as: "section",
		});
	};

	// queries and other function starts
	Student.getDS = async () => {
		try {
			return await Student.findAll({
				where:{
					status: true
				},
				attributes: ['id', 'first_name', 'middle_name', 'last_name', 'school_id', 'class_id' ]
			});
		} catch (e) {
			return [];
		}
	};

	Student.getList = async () => {
		try {
            const { Class, Section, School } = sequelize.models;
			return await Student.findAll({
				where:{
					status: true
				},
                include: [
					{ model : School, as : 'school', attributes: ['id', 'school_name'] },
					{ model : Class, as : 'class', attributes: ['id', 'class_name'] },
					{ model : Section, as : 'section', attributes: ['id', 'section_name'] }
				],
				attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'school_id', 'class_id', 'section_id', 'mobile_no', 'gender' ]
			});
		} catch (e) {
			return [];
		}
	};

	Student.getListClassWise = async () => {
		try {
            const { School, Class, Level, Subject, Section } = sequelize.models;
			const studentResponse = await Student.findAll({
				where:{
					status: true
				},
                include: [
					{ model : School, as : 'school', attributes: ['id', 'school_name'] },
					{ model : Class, as : 'class', attributes: ['id', 'class_name'] },
					{ model : Section, as : 'section', attributes: ['id', 'section_name'] }
				],
				attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'school_id', 'class_id', 'section_id', 'mobile_no', 'gender' ]
			});

			const Exam = require('../models').Exam; // Assuming you have an Exam model
			const Question = require('../models').Question;

			await Promise.all(studentResponse.map(async (val, ind) => {
				const exam = await Exam.findAll({
				  where: {
					class_id: val.dataValues.class_id,
					status: true
				  },
				  include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Subject, as: "subject", attributes: ['id', 'subject_name'] },
					{ model: Level, as: "level", attributes: ['id', 'level_name'] },
				  ],
				  attributes: ['id', 'exam_name', 'class_id', 'level_id', 'subject_id', 'status']
				});
			  
				// Use Promise.all to wait for all inner promises
				await Promise.all(exam.map(async (v, inx) => {
				  const q = await Question.findAll({
					where: {
					  exam_id: v.dataValues.id,
					  status: true
					},
					attributes: ['id', 'mark'],
				  });
			  
				  let qq = q.reduce((t, vv) => {
					let dd = vv.dataValues.mark === '' ? 0 : vv.dataValues.mark;
					return Number(t) + Number(dd);
				  }, 0);
				  
				  exam[inx].dataValues.outoff = qq;
				}));
			  
				studentResponse[ind].dataValues.exam = exam;
			  }));
			return studentResponse
		} catch (e) {
			return [];
		}
	};

	Student.saveRecord = async (reqData) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				const saveObj = {
					...reqData,
					createdAt: new Date(),
					updatedAt: new Date()
				};
				return await Student.create(saveObj, { transaction: t });
			});
			// return result from saved record
			return result;
		} catch (e) {
			return false;
		}
	};

	Student.saveMultipleRecord = async (reqDataArray) => {
		try {
			const result = await sequelize.transaction(async (t) => {
			  const savePromises = reqDataArray.map(async (reqData) => {
				const saveObj = {
				  ...reqData,
				  createdAt: new Date(),
				  updatedAt: new Date()
				};
				return await Student.create(saveObj, { transaction: t });
			  });
		
			  // Use Promise.all to wait for all save operations to complete
			  return await Promise.all(savePromises);
			});
		
			// Return results from saved records
			return result;
		  } catch (e) {
			console.error(e);
			return false;
		  }
	};

	Student.getRecordById = async (id) => {
		const { School, Class, Level, Subject, Exam, Section } = sequelize.models;

		try {
			const searchRecord = await Student.findByPk(id, {
				include: [
					{ model : School, as : 'school', attributes: ['id', 'school_name'] },
					{ model : Class, as : 'class', attributes: ['id', 'class_name']},
					{ model : Section, as : 'section', attributes: ['id', 'section_name'] }
				],
				attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'school_id', 'class_id', 'section_id', 'mobile_no', 'gender', 'status']
			})

			if(!searchRecord || !searchRecord.status) return false;

			// Find exams with a similar class_id to the student's class_id
			const Exam = require('../models').Exam; // Assuming you have an Exam model
			const MarkAllotment = require('../models').MarkAllotment; 
			const Question = require('../models').Question; 

			const exam = await Exam.findAll({
				where: {
					class_id: searchRecord.class_id,
					status: true
				},
				include: [
					{ model : Class, as : 'class', attributes: ['id', 'class_name']},
					{ model: Subject, as: "subject", attributes: ['id', 'subject_name'], },
					{ model: Level, as: "level", attributes: ['id', 'level_name'], },
				],
				attributes: ['id', 'exam_name', 'class_id', 'level_id', 'subject_id', 'status']
			})

			const markAllotmentPromises = await exam.map(async (e, ind) => {
				const q = await Question.findAll({
					where: {
						exam_id: e.dataValues.id,
						status: true
					},
					attributes: ['id', 'mark'],
				});

				let qq = await q.reduce((t, val) => {
					let dd = val.dataValues.mark === '' ? 0 : val.dataValues.mark
					return Number(t) + Number(dd)
				}, 0)

				exam[ind] = {...e.dataValues, outoff: qq}

				const markAllotments = await MarkAllotment.findAll({
					where: {
						class_id: searchRecord.dataValues.class_id,
						subject_id: e.dataValues.subject_id,
						student_id: id,
						level_id: e.dataValues.level_id,
						exam_id: e.dataValues.id,
						status: true
					},
					include: [
						{ model : Class, as : 'class', attributes: ['id', 'class_name']},
						{ model: Subject, as: "subject", attributes: ['id', 'subject_name'], },
						{ model: Level, as: "level", attributes: ['id', 'level_name'], },
					],
					attributes: ['id', 'class_id', 'level_id', 'subject_id', 'exam_id', 'obtain', 'outoff'],
				});
				return markAllotments.map(markAllotment => markAllotment.dataValues);
			});
			
			let markAllotments = await Promise.all(markAllotmentPromises);

			let mmm = []
			markAllotments.map((val) => {
				if(val.length > 0){
					mmm.push(val[0])
				}
			})

			await mmm.map(async (m) => {
				const exi = await exam.findIndex(e => {
					return e.class_id === m.class_id && e.level_id === m.level_id && e.subject_id === m.subject_id && e.id === m.exam_id
				});
				exam[exi].mark = m
			})

			return {
				...searchRecord.dataValues,
				exam,
			};
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	Student.getRecordByOnlyId = async (id) => {
		const { School, Class, Section } = sequelize.models;

		try {
			const searchRecord = await Student.findByPk(id, {
				include: [
					{ model : School, as : 'school', attributes: ['id', 'school_name'] },
					{ model : Class, as : 'class', attributes: ['id', 'class_name'] },
					{ model : Section, as : 'section', attributes: ['id', 'section_name'] }
				],
				attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'school_id', 'class_id', 'section_id', 'mobile_no', 'gender', 'status']
			});
			if(!searchRecord || !searchRecord.status) return false;

			return searchRecord;
		} catch (e) {
			return false;
		}
	};

	Student.getRecordByDeleteId = async (id) => {
		const { School, Class, Level, Subject, Exam, Section } = sequelize.models;

		try {
			return await Student.findByPk(id, {
				include: [
					{ model : School, as : 'school', attributes: ['id', 'school_name'] },
					{ model : Class, as : 'class', attributes: ['id', 'class_name']},
					{ model : Section, as : 'section', attributes: ['id', 'section_name'] }
				],
				attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'school_id', 'class_id', 'section_id', 'mobile_no', 'gender', 'status']
			})			
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	Student.updateRecord = async (record, reqData) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				const updateObj = {
					...reqData,
					updatedAt: new Date()
				};
				return await record.update(updateObj, { transaction: t });
			});
			// return result from updated record
			return result;
		} catch (e) {
			return false;
		}
	};

	Student.deleteRecord = async (record) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				return await record.update({
					status: false,
					updatedAt: new Date()
				}, { transaction: t });
			});
			// return result from updated record
			return result;
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	return Student;
};