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

	const Question = sequelize.define('Question', {
		id: {
			allowNull: false,
			autoIncrement: true,
			primaryKey: true,
			type: DataTypes.INTEGER
		},
		class_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
		},
		subject_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
		},
		exam_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
		},
		exam_section: {
			type: DataTypes.ENUM,
			values: ['A', 'B'],
			allowNull: true,
		},
		question_name: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		optionA: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		optionB: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		optionC: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		optionD: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		correct_option: {
			type: DataTypes.TEXT,
			allowNull: true,
		},
		mark: {
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
		tableName: 'questions'
	});

	Question.associate = function (models) {
		// associations can be defined here
		Question.belongsTo(models.Class, {
			foreignKey: "class_id",
			as: "class",
		});
		Question.belongsTo(models.Subject, {
			foreignKey: "subject_id",
			as: "subject",
		})
		Question.belongsTo(models.Exam, {
			foreignKey: "exam_id",
			as: "exam",
		})
	};

	// queries and other function starts
	Question.getDS = async () => { // only for masters
		try {
			return await Question.findAll({
				where: {
					status: true
				},
				attributes: ['id', 'question_name', 'exam_section']
			});
		} catch (e) {
			return [];
		}
	};

	Question.getList = async () => {
		try {
			const { Class, Subject, Exam } = sequelize.models;
			return await Question.findAll({
				where: {
					status: true
				},
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] }
				],
				attributes: ['id', 'class_id', 'subject_id', 'exam_id', 'exam_section', 'question_name', 'optionA', 'optionB', 'optionC', 'optionD', 'correct_option', 'mark']
			});
		} catch (e) {
			return [];
		}
	};

	Question.saveRecord = async (reqData) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				const saveObj = {
					...reqData,
					createdAt: new Date(),
					updatedAt: new Date()
				};
				return await Question.create(saveObj, { transaction: t });
			});
			// return result from saved record
			return result;
		} catch (e) {
			return false;
		}
	};

	Question.saveMultipleRecord = async (reqDataArray) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				const savePromises = reqDataArray.map(async (reqData) => {
					const saveObj = {
						...reqData,
						createdAt: new Date(),
						updatedAt: new Date()
					};
					return await Question.create(saveObj, { transaction: t });
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

	Question.getRecordById = async (id) => {
		try {
			const { Class, Subject, Exam } = sequelize.models;
			const searchRecord = await Question.findByPk(id, {
				attributes: ['id', 'class_id', 'subject_id', 'exam_id', 'exam_section', 'question_name', 'optionA', 'optionB', 'optionC', 'optionD', 'correct_option', 'mark', 'status'],
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] }
				]
			});
			console.log(searchRecord.status)
			if (!searchRecord || !searchRecord.status) return false;
			return searchRecord;
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	Question.getRecordByExamId = async (exam_id) => {
		try {
			const { Class, Subject, Exam } = sequelize.models;
			const searchRecord = await Question.findAll({
				where: {
					exam_id: exam_id,
					status: true
				},
				attributes: ['id', 'class_id', 'subject_id', 'exam_id', 'exam_section', 'question_name', 'optionA', 'optionB', 'optionC', 'optionD', 'correct_option', 'mark'],
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] },
				],
			});
			if (!searchRecord || !searchRecord.length) return false; // Check if the array is empty
			return searchRecord;
		} catch (e) {
			console.log(e)
			return false;
		}
	};


	Question.getFilteredQuestions = async (class_id, subject_id, exam_id, exam_section) => {
		try {
			const { Class, Subject, Exam, Question } = sequelize.models;
			const searchRecord = await Question.findAll({
				where: {
					class_id: class_id,
					subject_id: subject_id,
					exam_id: exam_id,
					exam_section: exam_section,
				},
				attributes: ['id', 'class_id', 'subject_id', 'exam_id', 'exam_section', 'question_name', 'optionA', 'optionB', 'optionC', 'optionD', 'correct_option', 'mark'],
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] },
					{ model: Exam, as: 'exam', attributes: ['id', 'exam_name'] },
				],
			});
			if (!searchRecord || !searchRecord.length) return false;
			return searchRecord;
		} catch (e) {
			console.log(e)
			return false;
		}
	}

	Question.updateRecord = async (record, reqData) => {
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

	Question.deleteRecord = async (record) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				// Find all markallotedment records related to the question
				const markallotedmentRecords = await ParticularMarkAllotment.findAll({
					where: { question_id: record.dataValues.id },
					transaction: t
				});

				if (markallotedmentRecords) {
					// Update each markallotedment record
					const updatePromises = markallotedmentRecords.map(async (markallotedmentRecord) => {
						await markallotedmentRecord.update({
							status: 0, // Set it to null or the appropriate value
							updatedAt: new Date()
						}, { transaction: t });
					});

					// Wait for all updates to complete
					await Promise.all(updatePromises);
				}

				// Soft-delete the question record
				return await record.update({
					status: false,
					updatedAt: new Date()
				}, { transaction: t });
			});

			// Return the result from the updated question record
			return result;
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	return Question;
};