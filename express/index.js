// Suggested code may be subject to a license. Learn more: ~LicenseLog:2406396442.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:481154180.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2635277472.
import express from 'express';
import cors from 'cors';

const app = express()
 app.use(cors())

app.get('/', (req, res) => {
  res.send('Hello World!')
  console.log("Requested")
})

app.listen(3000, () => {
  console.log('Example app listening on port 3000')
})