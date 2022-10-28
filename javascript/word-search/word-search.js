export class WordSearch {
    constructor(grid) {
        this._grid = grid
    }

    find(words) {
        return words.reduce((acc, word) => {
            return { [word]: this.find_word(word), ...acc }
        }, {})
    }

    find_word(_word) {
        return undefined
    }
}

export default WordSearch;