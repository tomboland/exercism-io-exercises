export class List {
  constructor(list) {
    this._list = list || []
  }

  get values() {
    return this._list
  }

  append(list) {
    return new List([...this.values, ...list.values])
  }

  concat(list) {
    return this.append(new List(Array.prototype.concat(...list.values.map((l) => l.values))))
  }

  filter(func) {
    const _filter = (acc, [head, ...tail]) => head
      ? _filter(func(head) ? [...acc, head] : acc, tail)
      : acc
    return new List(_filter([], this.values))
  }

  map(func) {
    const _map = (acc, [head, ...tail]) => head
      ? _map([...acc, func(head)], tail)
      : acc
    return new List(_map([], this.values))
  }

  length() {
    return this.values.reduce((acc) => acc + 1, 0)
  }

  foldl(func, initial_acc) {
    const _foldl = (acc, [head, ...tail]) => head
      ? _foldl(func(acc, head), tail)
      : acc
    return _foldl(initial_acc, this.values)
  }

  foldr(func, initial_acc) {
    const _foldr = (acc, [head, ...tail]) => head
      ? func(_foldr(acc, tail), head)
      : acc
    return _foldr(initial_acc, this.values)
  }

  reverse() {
    const _reverse = (acc, [head, ...tail]) => head
      ? [..._reverse(acc, tail), head]
      : acc
    return new List(_reverse([], this.values))
  }
}
