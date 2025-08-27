// Zeynep YILDIZ

import Foundation

public class URLCleaner {
    public init() {}
    
    public static func cleanURL(_ urlString: String) -> String {
        // Clean the URL
        let trimmedURL = urlString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Parse the URL
        guard let url = URL(string: trimmedURL),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return trimmedURL
        }
        
        // Check if URL is already clean (no parameters to remove)
        if isAlreadyClean(components) {
            return trimmedURL
        }
        
        // Key content parameters to keep
        let keepKeywords = ["list", "v", "playlist", "channel", "watch", "playnext", "id"]
        
        // Filter query parameters to keep only content-related ones
        if let queryItems = components.queryItems {
            components.queryItems = queryItems.filter { queryItem in
                let name = queryItem.name.lowercased()
                
                // Keep if the parameter name contains any of the keep keywords
                let shouldKeep = keepKeywords.contains { keyword in
                    name.contains(keyword.lowercased())
                }
                
                // Also keep if it's a content ID (like track ID, post ID, etc.)
                if name == "id" || name == "track" || name == "post" || name == "status" {
                    return true
                }
                
                return shouldKeep
            }
            
            // If no query items left, set to nil to remove the trailing ?
            if components.queryItems?.isEmpty == true {
                components.queryItems = nil
            }
        }
        
        // Remove fragment
        components.fragment = nil
        
        // Reconstruct the URL
        guard let cleanedURL = components.url else {
            return trimmedURL
        }
        
        return cleanedURL.absoluteString
    }
    
    public static func isCleanable(_ urlString: String) -> Bool {
        let trimmedURL = urlString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if it's a valid URL
        guard let url = URL(string: trimmedURL) else {
            return false
        }
        
        // Check if it has a scheme (http, https, etc.)
        guard let scheme = url.scheme, !scheme.isEmpty else {
            return false
        }
        
        // Check if it has a host
        guard let host = url.host, !host.isEmpty else {
            return false
        }
        
        return true
    }
    
    public static func isAlreadyClean(_ urlString: String) -> Bool {
        let trimmedURL = urlString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let url = URL(string: trimmedURL),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return false
        }
        
        return isAlreadyClean(components)
    }
    
    private static func isAlreadyClean(_ components: URLComponents) -> Bool {
        // Check if there are any query parameters to remove
        let hasQueryParams = components.queryItems?.isEmpty == false
        
        // Check if there's a fragment to remove
        let hasFragment = components.fragment != nil
        
        // If there are no query params and no fragment, the URL is already clean
        return !hasQueryParams && !hasFragment
    }
    
    public static func needsCleaning(_ urlString: String) -> Bool {
        return !isAlreadyClean(urlString)
    }
}