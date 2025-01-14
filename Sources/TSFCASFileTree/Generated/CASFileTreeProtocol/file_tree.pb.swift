// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: CASFileTreeProtocol/file_tree.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public enum LLBFileType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  //// A plain file.
  case plainFile // = 0

  //// An executable file.
  case executable // = 1

  //// A directory.
  case directory // = 2

  //// A symbolic link.
  case symlink // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .plainFile
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .plainFile
    case 1: self = .executable
    case 2: self = .directory
    case 3: self = .symlink
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .plainFile: return 0
    case .executable: return 1
    case .directory: return 2
    case .symlink: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension LLBFileType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [LLBFileType] = [
    .plainFile,
    .executable,
    .directory,
    .symlink,
  ]
}

#endif  // swift(>=4.2)

public enum LLBFileDataCompressionMethod: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  //// No compression is applied.
  case none // = 0
  case UNRECOGNIZED(Int)

  public init() {
    self = .none
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .none
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .none: return 0
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension LLBFileDataCompressionMethod: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [LLBFileDataCompressionMethod] = [
    .none,
  ]
}

#endif  // swift(>=4.2)

public struct LLBPosixFileDetails {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// The POSIX permissions (&0o7777). Masking is useful when storing entries
  //// with very restricted permissions (such as (perm & 0o0007) == 0).
  public var mode: UInt32 = 0

  //// Owner user identifier.
  //// Semantically, absent owner == 0x0 ~= current uid.
  public var owner: UInt32 = 0

  //// Owner group identifier.
  //// Semantically, absent owner == 0x0 ~= current gid.
  public var group: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct LLBDirectoryEntry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// The name of the directory entry.
  public var name: String = String()

  //// The type of the directory entry.
  public var type: LLBFileType = .plainFile

  //// The (aggregate) size of the directory entry.
  public var size: UInt64 = 0

  //// Mode and permissions. _Can_ optionally be present in the
  //// directory entry because the file can be just a direct blob reference.
  public var posixDetails: LLBPosixFileDetails {
    get {return _posixDetails ?? LLBPosixFileDetails()}
    set {_posixDetails = newValue}
  }
  /// Returns true if `posixDetails` has been explicitly set.
  public var hasPosixDetails: Bool {return self._posixDetails != nil}
  /// Clears the value of `posixDetails`. Subsequent reads from it will return its default value.
  public mutating func clearPosixDetails() {self._posixDetails = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _posixDetails: LLBPosixFileDetails? = nil
}

//// The list of file names and associated information, of a directory.
////  * The children are sorted by name.
////  * FIXME: collation rules or UTF-8 normalization guarantees?
public struct LLBDirectoryEntries {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var entries: [LLBDirectoryEntry] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct LLBFileInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// The type of the CASTree entry.
  public var type: LLBFileType = .plainFile

  //// The file data size or the aggregate directory data size (recursive).
  //// Whether directory data includes the size of the directory catalogs
  //// is unspecified.
  public var size: UInt64 = 0

  //// OBSOLETE. Use posixDetails.
  //// The POSIX permissions (&0o777). Useful when storing entries
  //// with very restricted permissions (such as (perm & 0o007) == 0).
  public var posixPermissions: UInt32 = 0

  //// Whether and what compression is applied to file data.
  ////  * Compression ought not to be applied to symlinks.
  ////  * Compression is applied after chunking, to retain seekability.
  public var compression: LLBFileDataCompressionMethod = .none

  //// Permission info useful for POSIX filesystems.
  public var posixDetails: LLBPosixFileDetails {
    get {return _posixDetails ?? LLBPosixFileDetails()}
    set {_posixDetails = newValue}
  }
  /// Returns true if `posixDetails` has been explicitly set.
  public var hasPosixDetails: Bool {return self._posixDetails != nil}
  /// Clears the value of `posixDetails`. Subsequent reads from it will return its default value.
  public mutating func clearPosixDetails() {self._posixDetails = nil}

  public var payload: LLBFileInfo.OneOf_Payload? = nil

  //// Files and symlinks:
  ////  * The file payload is contained in one or more
  ////    fixed size references to [compressed] data.
  ////  * The `fixedChunkSize` value helps to do O(1) seeking.
  public var fixedChunkSize: UInt64 {
    get {
      if case .fixedChunkSize(let v)? = payload {return v}
      return 0
    }
    set {payload = .fixedChunkSize(newValue)}
  }

  //// Directories:
  ////  * Directory entries are represented inline.
  public var inlineChildren: LLBDirectoryEntries {
    get {
      if case .inlineChildren(let v)? = payload {return v}
      return LLBDirectoryEntries()
    }
    set {payload = .inlineChildren(newValue)}
  }

  //// Directories:
  ////  * Directory entries are represented as a reference to a B-tree.
  ////  * The `compression` does have effect on the B-tree data.
  public var referencedChildrenTree: UInt32 {
    get {
      if case .referencedChildrenTree(let v)? = payload {return v}
      return 0
    }
    set {payload = .referencedChildrenTree(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Payload: Equatable {
    //// Files and symlinks:
    ////  * The file payload is contained in one or more
    ////    fixed size references to [compressed] data.
    ////  * The `fixedChunkSize` value helps to do O(1) seeking.
    case fixedChunkSize(UInt64)
    //// Directories:
    ////  * Directory entries are represented inline.
    case inlineChildren(LLBDirectoryEntries)
    //// Directories:
    ////  * Directory entries are represented as a reference to a B-tree.
    ////  * The `compression` does have effect on the B-tree data.
    case referencedChildrenTree(UInt32)

  #if !swift(>=4.1)
    public static func ==(lhs: LLBFileInfo.OneOf_Payload, rhs: LLBFileInfo.OneOf_Payload) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.fixedChunkSize, .fixedChunkSize): return {
        guard case .fixedChunkSize(let l) = lhs, case .fixedChunkSize(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.inlineChildren, .inlineChildren): return {
        guard case .inlineChildren(let l) = lhs, case .inlineChildren(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.referencedChildrenTree, .referencedChildrenTree): return {
        guard case .referencedChildrenTree(let l) = lhs, case .referencedChildrenTree(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _posixDetails: LLBPosixFileDetails? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension LLBFileType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PLAIN_FILE"),
    1: .same(proto: "EXECUTABLE"),
    2: .same(proto: "DIRECTORY"),
    3: .same(proto: "SYMLINK"),
  ]
}

extension LLBFileDataCompressionMethod: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NONE"),
  ]
}

extension LLBPosixFileDetails: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBPosixFileDetails"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "mode"),
    2: .same(proto: "owner"),
    3: .same(proto: "group"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.mode) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.owner) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.group) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.mode != 0 {
      try visitor.visitSingularUInt32Field(value: self.mode, fieldNumber: 1)
    }
    if self.owner != 0 {
      try visitor.visitSingularUInt32Field(value: self.owner, fieldNumber: 2)
    }
    if self.group != 0 {
      try visitor.visitSingularUInt32Field(value: self.group, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBPosixFileDetails, rhs: LLBPosixFileDetails) -> Bool {
    if lhs.mode != rhs.mode {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.group != rhs.group {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LLBDirectoryEntry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBDirectoryEntry"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "type"),
    3: .same(proto: "size"),
    4: .same(proto: "posixDetails"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.size) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._posixDetails) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if self.type != .plainFile {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 2)
    }
    if self.size != 0 {
      try visitor.visitSingularUInt64Field(value: self.size, fieldNumber: 3)
    }
    if let v = self._posixDetails {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBDirectoryEntry, rhs: LLBDirectoryEntry) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.type != rhs.type {return false}
    if lhs.size != rhs.size {return false}
    if lhs._posixDetails != rhs._posixDetails {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LLBDirectoryEntries: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBDirectoryEntries"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "entries"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.entries) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.entries.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.entries, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBDirectoryEntries, rhs: LLBDirectoryEntries) -> Bool {
    if lhs.entries != rhs.entries {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LLBFileInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = "LLBFileInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "size"),
    3: .same(proto: "posixPermissions"),
    4: .same(proto: "compression"),
    5: .same(proto: "posixDetails"),
    11: .same(proto: "fixedChunkSize"),
    12: .same(proto: "inlineChildren"),
    13: .same(proto: "referencedChildrenTree"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.size) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.posixPermissions) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self.compression) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._posixDetails) }()
      case 11: try {
        var v: UInt64?
        try decoder.decodeSingularUInt64Field(value: &v)
        if let v = v {
          if self.payload != nil {try decoder.handleConflictingOneOf()}
          self.payload = .fixedChunkSize(v)
        }
      }()
      case 12: try {
        var v: LLBDirectoryEntries?
        var hadOneofValue = false
        if let current = self.payload {
          hadOneofValue = true
          if case .inlineChildren(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.payload = .inlineChildren(v)
        }
      }()
      case 13: try {
        var v: UInt32?
        try decoder.decodeSingularUInt32Field(value: &v)
        if let v = v {
          if self.payload != nil {try decoder.handleConflictingOneOf()}
          self.payload = .referencedChildrenTree(v)
        }
      }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .plainFile {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    if self.size != 0 {
      try visitor.visitSingularUInt64Field(value: self.size, fieldNumber: 2)
    }
    if self.posixPermissions != 0 {
      try visitor.visitSingularUInt32Field(value: self.posixPermissions, fieldNumber: 3)
    }
    if self.compression != .none {
      try visitor.visitSingularEnumField(value: self.compression, fieldNumber: 4)
    }
    if let v = self._posixDetails {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.payload {
    case .fixedChunkSize?: try {
      guard case .fixedChunkSize(let v)? = self.payload else { preconditionFailure() }
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 11)
    }()
    case .inlineChildren?: try {
      guard case .inlineChildren(let v)? = self.payload else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
    }()
    case .referencedChildrenTree?: try {
      guard case .referencedChildrenTree(let v)? = self.payload else { preconditionFailure() }
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 13)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: LLBFileInfo, rhs: LLBFileInfo) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.size != rhs.size {return false}
    if lhs.posixPermissions != rhs.posixPermissions {return false}
    if lhs.compression != rhs.compression {return false}
    if lhs._posixDetails != rhs._posixDetails {return false}
    if lhs.payload != rhs.payload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
