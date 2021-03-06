//
//  String+Extension.swift
//  Twig
//
//  Created by Luka Kerr on 1/7/18.
//  Copyright © 2018 Luka Kerr. All rights reserved.
//

import Foundation

extension String {

  static var FilePrefix = "file://"

  public var isMarkdown: Bool {
    return hasSuffix(".md")
  }

  public var isBaseFile: Bool {
    return self == "file:///" || self == "file://"
  }

  public var isWebLink: Bool {
    return contains("http")
  }

  /// Decode URL and convert ~ to Home directory
  public func decodeURL() -> String? {
    let fileManager = FileManager.default

    return self
      .removingPercentEncoding?
      .replacingOccurrences(of: "~", with: fileManager.homeDirectoryForCurrentUser.path)
  }

}
