import sCode from "../../../custom/status-codes";
const { ok, created, bad_request, server_error } = sCode;
import {
    getValidationErrMsg,
    getIdNotFoundCommonMsg,
    getServerErrorMsg,
} from '../../../custom/error-msg';

// models import here
import model from '../../../db/models';
const { Game, Subject, Level, Class } = model;


// validation import here
import validateGame from '../../../requests/gameRequest';


export default {
    async getGameDS(req, res) {
        try {
            const classes = await Class.getDS();
            const levels = await Level.getDS();
            const subjects = await Subject.getDS();
            res.status(ok).send({ classes, levels,subjects });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async getGames(req, res) {
        try {
            const games = await Game.getList();
            res.status(ok).send({ games });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);

        }
    },

    async addGame(req, res) {
        try {
            const { error } = validateGame(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });
            // if (!req.files || Object.keys(req.files).length === 0) {
			// 	return res.status(400).send('No files were uploaded.');
			//   }
              let file1 = ''
              let file2 = ''
              let file3 = ''
              if (req.files !== null && req.files.file1 !== undefined) {
                file1 = `${Math.floor(Math.random()*1000)}${req.files.file1.name}`
                // Use the mv() method to move the file to a specific location on your server
                await req.files.file1.mv(`./upload/${file1}`, (err) => {
                  if (err) {
                      console.log(err)
                      return res.status(500).send(err);
                  }
                })
              }
              
              if (req.files !== null && req.files.file2 !== undefined) {
                file2 = `${Math.floor(Math.random()*1000)}${req.files.file2.name}`
                await req.files.file2.mv(`./upload/${file2}`, (err) => {
                    if (err) {
                        console.log(err)
                        return res.status(500).send(err);
                    }
                })
              }

              if (req.files !== null && req.files.file3 !== undefined) {
                file3 = `${Math.floor(Math.random()*1000)}${req.files.file3.name}`
                await req.files.file3.mv(`./upload/${file3}`, (err) => {
                    if (err) {
                        console.log(err)
                        return res.status(500).send(err);
                    }
                })
              }
            const game = await Game.saveRecord({...req.body, file1, file2, file3});
            if (!game) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ game });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async importGame(req, res) {
        try {
            let err = false
            let ee = []
            await req.body.map((v) => {
                const {error}  = validateGame(v)
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

            const game = await Game.saveMultipleRecord(req.body);

            if (!game) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ game });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },
    
    async getGame(req, res) {
        try {
            const { id } = req.params;
            const recordExist = await Game.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('game') });
            res.status(ok).send({ game: recordExist });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },
    
    async updateGame(req, res) {
        try {
            const { error } = validateGame(req.body);
            if (error) return res.status(bad_request).send({ error: getValidationErrMsg(error) });

            const { id } = req.params;
            let recordExist = await Game.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('game') });
            
            let files = {}
            if (req.files !== null) {
                let file1 = ''
                let file2 = ''
                let file3 = ''

				if (req.files.file1 !== undefined) {
                    file1 = `${Math.floor(Math.random()*1000)}${req.files.file1.name}`
                    // Use the mv() method to move the file to a specific location on your server
                    await req.files.file1.mv(`./upload/${file1}`, (err) => {
                      if (err) {
                          console.log(err)
                          return res.status(500).send(err);
                      }
                    })
                  }
                  
                  if (req.files.file2 !== undefined) {
                    file2 = `${Math.floor(Math.random()*1000)}${req.files.file2.name}`
                    await req.files.file2.mv(`./upload/${file2}`, (err) => {
                        if (err) {
                            console.log(err)
                            return res.status(500).send(err);
                        }
                    })
                  }
    
                  if (req.files.file3 !== undefined) {
                    file3 = `${Math.floor(Math.random()*1000)}${req.files.file3.name}`
                    await req.files.file3.mv(`./upload/${file3}`, (err) => {
                        if (err) {
                            console.log(err)
                            return res.status(500).send(err);
                        }
                    })
                  }

                  if(file1 !== ''){
                    files= {...files, file1}
                  }
                  if(file2 !== ''){
                    files= {...files, file2}
                  }
                  if(file3 !== ''){
                    files= {...files, file3}
                  }
			}

            let data = {}
            if(Object.keys(files).length > 0) {
                data = {...req.body, ...files}
            } else {
                data = req.body
            }
              
            const game = await Game.updateRecord( recordExist, data );
            if (!game) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(created).send({ game });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    },

    async deleteGame(req, res) {
        try {
            const { id } = req.params;
            let recordExist = await Game.getRecordById(id);
            if (!recordExist) return res.status(bad_request).send({ message: getIdNotFoundCommonMsg('game') });

            const game = await Game.deleteRecord( recordExist );
            if (!game) return  res.status(server_error).send({ message: getServerErrorMsg() });
            res.status(ok).send({ game });
        } catch (e) {
            console.log(e);
            res.status(server_error).send(e);
        }
    }
}


