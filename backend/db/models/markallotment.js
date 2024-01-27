'use strict';
export default (sequelize, DataTypes) => {
	const ParticularMarkAllotment = sequelize.define('ParticularMarkAllotment', {
		id: {
			allowNull: false,
			autoIncrement: true,
			primaryKey: true,
			type: DataTypes.INTEGER
		},
        student_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        mark_allotments_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        question_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
		answer: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
        mark: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
		status: {
			type: DataTypes.BOOLEAN(true),
			allowNull: true,
			defaultValue: '1'
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
		tableName: 'particular_mark_allotment'
	});

	const MarkAllotment = sequelize.define('MarkAllotment', {
		id: {
			allowNull: false,
			autoIncrement: true,
			primaryKey: true,
			type: DataTypes.INTEGER
		},
        student_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        class_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        level_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        subject_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        exam_id: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
		outoff: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
        obtain: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
		remark: {
			type: DataTypes.TEXT,
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
		tableName: 'mark_allotments'
	});

	MarkAllotment.associate = function(models) {
		// associations can be defined here
        MarkAllotment.belongsTo(models.Student, {
            foreignKey: "student_id",
            as: "student",
		});
        MarkAllotment.belongsTo(models.Class, {
            foreignKey: "class_id",
            as: "class",
		});
        MarkAllotment.belongsTo(models.Level, {
            foreignKey: "level_id",
            as: "level",
		});
        MarkAllotment.belongsTo(models.Subject, {
            foreignKey: "subject_id",
            as: "subject",
		});
        MarkAllotment.belongsTo(models.Exam, {
            foreignKey: "exam_id",
            as: "exam",
		});
	};

	// queries and other function starts
	MarkAllotment.getList = async () => {
		try {
			const { Class, Level, Student, Subject, Exam } = sequelize.models;
			const markAllotments = await MarkAllotment.findAll({
				where: {
					status: true,
				},
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Level, as: 'level', attributes: ['id', 'level_name'] },
					{ model: Student, as: 'student', attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'mobile_no', 'gender', 'school_id'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] },
				],
				attributes: ['id', 'student_id', 'class_id', 'level_id', 'subject_id', 'exam_id','obtain', "outoff", 'remark'],
			});

			const que = await Promise.all(markAllotments.map(async (val) => {
				const particularMarkAllotments = await ParticularMarkAllotment.findAll({
				  where: {
					mark_allotments_id: val.dataValues.id,
					status: true
				  },
				  attributes: ['id', 'question_id', 'mark_allotments_id', 'answer', 'mark', 'status'],
				});
				// You can return particularMarkAllotments directly or process the data as needed
				return particularMarkAllotments;
			  }));

			  const school = require('../models').School;

			  const sch = await Promise.all(markAllotments.map(async (val, ind) => {
				const sch = await school.findOne({
				  where: {
					id: val.dataValues.student.school_id,
					status: true
				  },
				  attributes: ['id', 'school_name'],
				});
				// You can return particularMarkAllotments directly or process the data as needed
				markAllotments[ind].dataValues.school = {...markAllotments[ind].dataValues.school, ...sch.dataValues}
			  }));

			let data = []
			await que.map(async (val) => {
				if(val.length > 0){
					await val.map((v) => {
							data.push(v)
						})
				}
			})
			
			const Question = require('../models').Question;

			let sectionA = 0
			let sectionB = 0
			await Promise.all(markAllotments.map(async (val, ind) => {
				const m = []
				await Promise.all(data.map(async (d) => {
				  if(val.id === d.dataValues.mark_allotments_id){
					let qq = await Question.findOne({
						where: {
						  id: d.dataValues.question_id,
						  status: true
						},
						attributes: ['id', 'question_name', 'correct_option', 'optionA', 'optionB', 'optionC', 'optionD', 'mark', 'exam_section', 'status'],
					  });

					if(qq.dataValues.exam_section === 'A') {
						sectionA = Number(sectionA) + Number(d.dataValues.mark)
					}
					if(qq.dataValues.exam_section === 'B') {
						sectionB = Number(sectionB) + Number(d.dataValues.mark)
					}
					d.dataValues = {...d.dataValues, question: qq}
				    m.push(d.dataValues)
				  }
				}));

				markAllotments[ind].dataValues.sectionA = sectionA
				markAllotments[ind].dataValues.sectionB = sectionB
				markAllotments[ind].dataValues.questionMarks = m;
			}));
			return markAllotments;
		} catch (e) {
			return [];
		}
	};
	

	MarkAllotment.saveRecord = async (reqData) => {
		try {
			let obtained = reqData.marks.reduce((t, v)=>{
                return Number(t) + Number(v.mark)
            }, 0)
			const Question = require('../models').Question; // Assuming you have an Exam model

			const outoffed = await Promise.all(reqData.marks.map(async (v) => {
				const q = await Question.findOne({
				  where: {
					id: v.question_id,
					status: true
				  },
				  attributes: ['id', 'mark']
				});
				
				return q.dataValues.mark !== "" && q.dataValues.mark;
			}));

			let outoff = outoffed.reduce((t, v)=>{
                return Number(t) + Number(v)
            }, 0)

			const result = await sequelize.transaction(async (t) => {
				const saveObj = {
					student_id: reqData.student_id,
					class_id: reqData.class_id,
					level_id: reqData.level_id,
					subject_id: reqData.subject_id,
					exam_id: reqData.exam_id,
					outoff: outoff,
					obtain: obtained,
					remark: reqData.remark,
					createdAt: new Date(),
					updatedAt: new Date()
				};
				return await MarkAllotment.create(saveObj, { transaction: t });
			});
			const parresult = await Promise.all(reqData.marks.map(async (m) => {
				return await sequelize.transaction(async (t) => {
					let d = {...m, student_id: reqData.student_id, mark_allotments_id: result.id}
					const saveObj = {
						...d,
						createdAt: new Date(),
						updatedAt: new Date()
					};
					return await ParticularMarkAllotment.create(saveObj, { transaction: t });
				});
			}))
			
			// return result from saved record
			return {...result.dataValues,  questionMarks: [...parresult]};
		} catch (e) {
			return false;
		}
	};

	MarkAllotment.getRecordByIdOnly = async (id) => {
		try {
			const { Class, Level, Student, Subject, Exam } = sequelize.models;

			const searchRecord = await MarkAllotment.findByPk(id, {
				attributes: ['id', 'student_id', 'class_id', 'level_id', 'subject_id', 'exam_id', 'outoff', 'obtain', 'remark', 'status'],
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Level, as: 'level', attributes: ['id', 'level_name'] },
					{ model: Student, as: 'student', attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'mobile_no', 'gender'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] },
				  ]
			});
			if(!searchRecord || !searchRecord.status) return false;
			return searchRecord;
		} catch (e) {
			return false;
		}
	};

	MarkAllotment.getRecordById = async (id) => {
		try {
			const { Class, Level, Student, Subject, Exam } = sequelize.models;

			const searchRecord = await MarkAllotment.findByPk(id, {
				attributes: ['id', 'student_id', 'class_id', 'level_id', 'subject_id', 'exam_id', 'outoff', 'obtain', 'remark', 'status'],
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Level, as: 'level', attributes: ['id', 'level_name'] },
					{ model: Student, as: 'student', attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'mobile_no', 'gender'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] },
				  ]
			});
			if(!searchRecord || !searchRecord.status) return false;

			const particularMarkAllotments = await ParticularMarkAllotment.findAll({
				where: {
				mark_allotments_id: searchRecord.dataValues.id,
				status: true
				},
				attributes: ['id', 'question_id', 'mark_allotments_id', 'answer', 'mark', 'status'],
			});			
			
			const Question = require('../models').Question;

			let m=[]
			let sectionA = 0
			let sectionB = 0
			await Promise.all(particularMarkAllotments.map(async (d) => {
				if(searchRecord.dataValues.id === d.dataValues.mark_allotments_id){
				let qq = await Question.findOne({
					where: {
						id: d.dataValues.question_id,
						status: true
					},
					attributes: ['id', 'question_name', 'correct_option', 'mark', 'exam_section', 'status'],
					});

					if(qq.dataValues.exam_section === 'A') {
						sectionA = Number(sectionA) + Number(d.dataValues.mark)
					}
					if(qq.dataValues.exam_section === 'B') {
						sectionB = Number(sectionB) + Number(d.dataValues.mark)
					}

				d.dataValues = {...d.dataValues, question: qq}
				m.push(d.dataValues)
				}
			}));

			searchRecord.dataValues.sectionA = sectionA
			searchRecord.dataValues.sectionB = sectionB

			return {
				...searchRecord.dataValues,
				questionMarks: m,
			};
		} catch (e) {
			return false;
		}
	};

	MarkAllotment.getStudentRecordById = async (student_id) => {
		try {
		  const { Class, Level, Student, Subject, Exam } = sequelize.models;
		  const searchRecord = await MarkAllotment.findAll({
			attributes: ['id', 'student_id', 'class_id', 'level_id', 'subject_id', 'exam_id', 'outoff', 'obtain', 'remark', 'status'],
			where: {
			  student_id: student_id,
			},
			include: [
			  { model: Class, as: 'class', attributes: ['id', 'class_name'] },
			  { model: Level, as: 'level', attributes: ['id', 'level_name'] },
			  { model: Student, as: 'student', attributes: ['id', 'first_name', 'middle_name', 'last_name', 'roll_no', 'mobile_no', 'gender'] },
			  { model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
			  { model: Exam, as: 'exam', attributes: ['id', 'exam_name'] },
			],
		  });
	  
		  if (!searchRecord || !searchRecord.length) return false; // Check if the array is empty
		  return searchRecord;
		} catch (e) {
		  return false;
		}
	  };
	  

	MarkAllotment.updateRecord = async (record, reqData) => {
		try {
			let obtained = reqData.marks.reduce((t, v)=>{
                return Number(t) + Number(v.mark)
            }, 0)
			const Question = require('../models').Question; // Assuming you have an Exam model

			const outoffed = await Promise.all(reqData.marks.map(async (v) => {
				const q = await Question.findOne({
				  where: {
					id: v.question_id,
					status: true
				  },
				  attributes: ['id', 'mark']
				});
				return q.dataValues.mark !== "" && q.dataValues.mark;
			}));

			let outoff = outoffed.reduce((t, v)=>{
                return Number(t) + Number(v)
            }, 0)

			const result = await sequelize.transaction(async (t) => {
				const updateObj = {
					student_id: reqData.student_id,
					class_id: reqData.class_id,
					level_id: reqData.level_id,
					subject_id: reqData.subject_id,
					exam_id: reqData.exam_id,
					outoff: outoff,
					obtain: obtained,
					remark: reqData.remark,
					updatedAt: new Date()
				};
				return await record.update(updateObj, { transaction: t });
			});

			let questionMarks = []
			await Promise.all(reqData.marks.map(async (v, ind) => {
				const q = await ParticularMarkAllotment.findOne({
				  where: {
					question_id: v.question_id,
					student_id: result.student_id,
					status: true
				  },
				  attributes: ['id', 'student_id', 'question_id', 'mark_allotments_id', 'answer', 'mark', 'status'],
				});
				let saveObj = {}
				if(q !== null) {
					let d = {...reqData.marks[ind], id: q.id,student_id: reqData.student_id, mark_allotments_id: result.id}
					saveObj = {
						...d,
						updatedAt: new Date()
					};
				}
				
				const d = await q.update(saveObj);
				questionMarks.push(d.dataValues)
			  }));


			// return result from updated record
			return {...result.dataValues, questionMarks};
		} catch (e) {
			return false;
		}
	};

	MarkAllotment.deleteRecord = async (record) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				return await record.update({
					status: false,
					updatedAt: new Date()
				}, { transaction: t });
			});

			return result;
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	return MarkAllotment;
};