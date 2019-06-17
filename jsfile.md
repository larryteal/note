```js
let file = _.get(files, 'file')
  if (!file) throw new Error('缺少文件')
  if (file.type !== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
    throw new Error('模版不一致')
  }
  let name = _.get(files, 'file.name')
  let fileExt = name.substring(name.lastIndexOf('.'))
  let fileName = `BatchAudit${Date.now()}${fileExt}`
  let targetFile = path.join(global.ROOT_PATH + '/uploads/', fileName)
  let pf = new Promise((resolve, reject) => {
    let readStream = fs.createReadStream(file.path)
    let writeStream = fs.createWriteStream(targetFile)
    readStream.on('end', () => {
      fs.unlinkSync(file.path)
    })
    writeStream.on('finish', () => resolve())
    readStream.on('error', (error) => reject(error))
    writeStream.on('error', (error) => reject(error))
    readStream.pipe(writeStream)
  })
  await pf
```