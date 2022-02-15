import Foundation

let file = FileIO()
let count = file.readInt()
var mnHeap = Heap(>)
var mxHeap = Heap(<)

var answer = ""

for _ in 0..<count {
    let d = file.readInt()
    if mxHeap.isEmpty {
        mxHeap.insert(d)
    }else {
        if d > mxHeap.first {
            mnHeap.insert(d)
        }else {
            mxHeap.insert(d)
        }
        
        if mxHeap.count == mnHeap.count+2 {
            mnHeap.insert(mxHeap.delete()!)
        }else if mxHeap.count+1 == mnHeap.count {
            mxHeap.insert(mnHeap.delete()!)
        }
    }
    answer += "\(mxHeap.first)\n"
}

print(answer)

struct Heap {
    var list = [Int]()
    var comparer: (Int,Int) -> Bool
    
    init(_ comparer : @escaping (Int,Int) -> Bool ) {
        self.comparer = comparer
    }
    
    mutating func insert(_ x: Int ) {
        var idx = list.count
        list.append(x)
        while idx>0, comparer(list[(idx-1)/2],list[idx]) {
            list.swapAt((idx-1)/2, idx)
            idx = (idx-1)/2
        }
    }
    mutating func delete() -> Int? {
        if list.isEmpty { return nil }
        list.swapAt(0, list.count-1)
        let delete = list.removeLast()
        var idx = 0, change = -1
        while idx < list.count {
            for k in idx*2+1...idx*2+2 {
                if k < list.count && comparer(list[idx], list[k]) {
                    if change == -1 || comparer(list[change], list[k]) {
                        change = k
                    }
                }
            }
            if change == -1 { break }
            list.swapAt(idx, change)
            idx = change; change = -1
        }
        return delete
    }
    var isEmpty: Bool { return list.isEmpty }
    var count: Int { return list.count}
    var first: Int { return list.first!}
}

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}