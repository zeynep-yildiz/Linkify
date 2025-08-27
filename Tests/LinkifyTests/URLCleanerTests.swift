// Zeynep YILDIZ


import XCTest
@testable import Linkify

final class URLCleanerTests: XCTestCase {
    func testCleanURL() {
        // Test Spotify URL
        let spotifyURL = "https://open.spotify.com/track/123?si=abc123"
        let cleanedSpotify = URLCleaner.cleanURL(spotifyURL)
        print("🎵 Spotify:")
        print("  Before: \(spotifyURL)")
        print("  After:  \(cleanedSpotify)")
        XCTAssertEqual(cleanedSpotify, "https://open.spotify.com/track/123")
        
        // Test Twitter/X URL
        let twitterURL = "https://twitter.com/user/status/123?s=20"
        let cleanedTwitter = URLCleaner.cleanURL(twitterURL)
        print("🐦 Twitter:")
        print("  Before: \(twitterURL)")
        print("  After:  \(cleanedTwitter)")
        XCTAssertEqual(cleanedTwitter, "https://twitter.com/user/status/123")
        
        // Test Instagram URL
        let instagramURL = "https://www.instagram.com/p/123/?igsh=abc123"
        let cleanedInstagram = URLCleaner.cleanURL(instagramURL)
        print("📸 Instagram:")
        print("  Before: \(instagramURL)")
        print("  After:  \(cleanedInstagram)")
        XCTAssertEqual(cleanedInstagram, "https://www.instagram.com/p/123/")
        
        // Test URL with multiple query parameters
        let multiParamURL = "https://example.com?utm_source=test&id=123&utm_medium=social"
        let cleanedMultiParam = URLCleaner.cleanURL(multiParamURL)
        print("🔗 Multi-param:")
        print("  Before: \(multiParamURL)")
        print("  After:  \(cleanedMultiParam)")
        XCTAssertEqual(cleanedMultiParam, "https://example.com?id=123")
        
        // Test URL with whitespace
        let whitespaceURL = "  https://example.com?ref=test  "
        let cleanedWhitespace = URLCleaner.cleanURL(whitespaceURL)
        print("📝 Whitespace:")
        print("  Before: \(whitespaceURL)")
        print("  After:  \(cleanedWhitespace)")
        XCTAssertEqual(cleanedWhitespace, "https://example.com")
    }
    
    func testIsCleanable() {
        // Valid URLs
        XCTAssertTrue(URLCleaner.isCleanable("https://example.com"))
        XCTAssertTrue(URLCleaner.isCleanable("http://example.com"))
        XCTAssertTrue(URLCleaner.isCleanable("https://example.com?param=value"))
        
        // Invalid URLs
        XCTAssertFalse(URLCleaner.isCleanable(""))
        XCTAssertFalse(URLCleaner.isCleanable("not a url"))
        XCTAssertFalse(URLCleaner.isCleanable("example.com")) // no scheme
        XCTAssertFalse(URLCleaner.isCleanable("https://")) // no host
    }
}
