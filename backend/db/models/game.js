'use strict';
export default (sequelize, DataTypes) => {
	const Game = sequelize.define('Game', {
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
        level_id: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
		subject_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
		},
		game_name: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
		game_topic: {
			type: DataTypes.STRING(191),
			allowNull: false,
		},
		game_type: {
			type: DataTypes.ENUM,
			values: ['A', 'B'],
			allowNull: true,
		},
		google: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
		youtube: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
		file1: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
		file2: {
			type: DataTypes.STRING(191),
			allowNull: true,
		},
		file3: {
			type: DataTypes.STRING(191),
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
		tableName: 'games'
	});

	Game.associate = function (models) {
		// associations can be defined here
		Game.belongsTo(models.Class, {
            foreignKey: "class_id",
            as: "class",
		});
        Game.belongsTo(models.Level, {
            foreignKey: "level_id",
            as: "level",
		});
		Game.belongsTo(models.Subject, {
			foreignKey: "subject_id",
			as: "subject",
		});
	};

	// queries and other function starts
	Game.getDS = async () => { // only for masters
		try {
			return await Game.findAll({
				where: {
					status: true
				},
				attributes: ['id', 'game_name', 'class_id']
			});
		} catch (e) {
			return [];
		}
	};

	Game.getList = async () => {
		try {
			const { Class, Level, Subject } = sequelize.models;
			return await Game.findAll({
				where: {
					status: true
				},
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Level, as: 'level', attributes: ['id', 'level_name'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] }
				],
				attributes: ['id', 'game_name', 'game_topic', 'game_type', 'class_id', 'level_id', 'subject_id', 'google', 'youtube', 'file1', 'file2', 'file3']
			});
		} catch (e) {
			return [];
		}
	};

	Game.saveRecord = async (reqData) => {
		try {
			const result = await sequelize.transaction(async (t) => {
				const saveObj = {
					...reqData,
					createdAt: new Date(),
					updatedAt: new Date()
				};
				console.log(saveObj,'save')
				return await Game.create(saveObj, { transaction: t });
			});
			// return result from saved record
			return result;
		} catch (e) {
			console.log(e)
			return false;
		}
	};

	Game.saveMultipleRecord = async (reqDataArray) => {
		try {
			const result = await sequelize.transaction(async (t) => {
			  const savePromises = reqDataArray.map(async (reqData) => {
				const saveObj = {
				  ...reqData,
				  file1: '',
				  file2: '',
				  file3: '',
				  createdAt: new Date(),
				  updatedAt: new Date()
				};
				return await Game.create(saveObj, { transaction: t });
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

	Game.getRecordById = async (id) => {
		try {
			const { Class, Level, Subject } = sequelize.models;
			const searchRecord = await Game.findByPk(id, {
				attributes: ['id', 'game_name', 'game_topic', 'game_type', 'class_id', 'level_id', "subject_id", 'google', 'youtube', 'file1', 'file2', 'file3', "status"],
				include: [
					{ model: Class, as: 'class', attributes: ['id', 'class_name'] },
					{ model: Level, as: 'level', attributes: ['id', 'level_name'] },
					{ model: Subject, as: 'subject', attributes: ['id', 'subject_name'] }
				]
			});
			if (!searchRecord || !searchRecord.status) return false;
			return searchRecord;
		} catch (e) {
			return false;
		}
	};

	Game.updateRecord = async (record, reqData) => {
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

	Game.deleteRecord = async (record) => {
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
			return false;
		}
	};

	return Game;
};