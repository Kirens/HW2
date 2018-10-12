const transpose
  = matrix2d =>
    matrix2d[0].map((_, i) =>
      matrix2d.map(row => row[i])
    )

const strToMatrix
  = text =>
    text.split('\n').map(line => line.split(''))

const matrixToLine
  = matrix2d =>
    matrix2d.map(row => row.join('')).join('')

const transposeFlattenStr
  = str =>
    matrixToLine(transpose(strToMatrix(str)))

process.stdin.on('data', data => process.stdout.write(transposeFlattenStr(data.toString())))
