const { Streams, F, C, N } = require("@masala/parser")

export class WordProblem {
    constructor(question) {
        const constP = C.string("What is ").drop().then(N.integer())
        const plusP = C.string(" plus ").drop()

        //then(N.integer()).map(({value}) => {console.log(value); return value[0] + value[1];})
        const operP = plusP.then(N.integer().map((x) => (y) => { console.log(x, y); return x + y;}))
        const exprP = operP.map(({value}) => {console.log(value); return value[0](value[1]);}).then(F.lazy(() => operP))

        this._answer = constP.then(exprP).parse(Streams.ofString(question))
        console.log(this._answer)
    }

    parse_question() {
    }

    answer() {
        return this._answer.value
    }
}