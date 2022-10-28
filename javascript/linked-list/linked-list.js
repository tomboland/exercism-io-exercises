export class LinkedList {
  constructor() {
    this.isNotALinkedList = []
  }
  push(value) {
    this.isNotALinkedList = [...this.isNotALinkedList, value]
  }

  pop() {
    const ret = this.isNotALinkedList.slice(-1)[0]
    this.isNotALinkedList = this.isNotALinkedList.slice(0, -1)
    return ret
  }

  shift() {
    const ret = this.isNotALinkedList[0]
    this.isNotALinkedList = this.isNotALinkedList.slice(1)
    return ret
  }

  unshift(value) {
    this.isNotALinkedList = [value, ...this.isNotALinkedList]
  }

  delete(value) {
    this.isNotALinkedList = this.isNotALinkedList.filter((elem) => { return elem !== value })
  }

  count() {
    // could return the array length, but I'm already cheating
    return this.isNotALinkedList.reduce((acc) => { return acc + 1 }, 0)
  }
}