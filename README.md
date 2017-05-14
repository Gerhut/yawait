# yawait [![Build Status][TravisBadge]][TravisPage] [![devDependency Status][DavidBadge]][DavidPage] [![Greenkeeper badge](https://badges.greenkeeper.io/Gerhut/yawait.svg)](https://greenkeeper.io/)

Yield a promise to await it.

## Install

    $ npm install yawait

## Usage

```js
var yawait = require('yawait')

yawait(function* () {
  console.log(yield Promise.resolve('result')) // result
  try {
    yield Promise.reject(Error('reason'))
  } catch(e) {
    console.log(e.message) // reason
  }
  return Promise.resolve('jump out')
}).then(function (value) {
  console.log(value) // jump out
})
```

## Test

    $ cd yawait
    $ npm install
    $ npm test

## License

    The MIT License (MIT)

    Copyright (c) 2015 George Chung

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


[TravisPage]: https://travis-ci.org/Gerhut/yawait
[TravisBadge]: https://travis-ci.org/Gerhut/yawait.svg?branch=master
[DavidPage]: https://david-dm.org/gerhut/yawait#info=devDependencies
[DavidBadge]: https://david-dm.org/gerhut/yawait/dev-status.svg
