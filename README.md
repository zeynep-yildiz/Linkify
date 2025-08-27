<a href="https://bit.ly/getlinkfy" target="_blank" style="text-decoration:none; display:inline-flex; align-items:center;">
  <img src="https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/3c/f8/83/3cf8838e-6cbb-36ee-461c-bfac951bc08c/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/460x0w.webp" alt="Linkify App Icon" width="36" style="vertical-align:middle; margin-right:8px;"/>
  <span style="font-size:2em; font-weight:bold; vertical-align:middle; color:inherit;">Linkify</span>
</a>

--- 

A Swift package that cleans up URLs by stripping out tracking parameters while keeping the important content. It's built with privacy in mind - everything happens locally on your device, so your data stays yours.

## 📱 Download Linkify App

[![Download on the App Store](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Download_on_the_App_Store_Badge.svg/135px-Download_on_the_App_Store_Badge.svg.png)](https://bit.ly/getlinkfy)

Get the Linkify app on the App Store for the best experience with URL cleaning on iOS and iPad.

---

## What It Does

- **Cleans URLs**: Strips tracking parameters, keeps the good stuff
- **Privacy-focused**: All processing happens on your device - no data sent anywhere
- **Works everywhere**: Supports 50+ platforms including YouTube, Twitter/X, Instagram, Facebook, LinkedIn, and more
- **Fast**: Optimized for speed and efficiency
- **Lightweight**: Pure Swift, no external dependencies

## What Gets Removed vs. What Stays

### Gets Removed (Tracking stuff)
These are the parameters that get stripped out:
- `si=abc123` (Spotify session IDs)
- `s=20` (Twitter/X tracking)
- `igsh=abc123` (Instagram sharing)
- `utm_source=test` (Google Analytics)
- `utm_medium=social` (Google Analytics)
- `ref=test` (Referral tracking)
- `fbclid=abc123` (Facebook click IDs)
- `gclid=abc123` (Google Ads)
- ...and plenty more!

### Stays (Important content)
These are the parameters that matter and get kept:
- `id=123` (Content IDs)
- `track=123` (Spotify track IDs)
- `status=123` (Twitter status IDs)
- `p/123/` (Instagram post IDs)
- `v=abc123` (Video IDs)
- `playlist=abc123` (Playlist IDs)
- `channel=abc123` (Channel IDs)

## Getting Started

### Swift Package Manager

Add Linkify to your Xcode project:
1. Go to File → Add Package Dependencies
2. Paste this URL: `https://github.com/zeynep-yildiz/Linkify.git`
3. Click Add Package

Or if you prefer, add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/zeynep-yildiz/Linkify.git", from: "1.0.0")
]
```

## How to Use It

### Basic URL Cleaning

```swift
import Linkify

// Clean up a Spotify URL
let dirtyURL = "https://open.spotify.com/track/123?si=abc123&utm_source=email"
let cleanURL = URLCleaner.cleanURL(dirtyURL)
// Result: "https://open.spotify.com/track/123"

// Clean up a Twitter URL
let twitterURL = "https://twitter.com/user/status/456?s=20&ref_src=email"
let cleanTwitter = URLCleaner.cleanURL(twitterURL)
// Result: "https://twitter.com/user/status/456"
```

### Check URL Status

```swift
// See if a URL is already clean
let isClean = URLCleaner.isAlreadyClean("https://example.com")
// Result: true

// Check if a URL needs cleaning
let needsCleaning = URLCleaner.needsCleaning("https://example.com?utm_source=test")
// Result: true
```

### Validate URLs

```swift
// Check if a URL can be cleaned (valid format)
let isValid = URLCleaner.isCleanable("https://example.com")
// Result: true

let isInvalid = URLCleaner.isCleanable("not a url")
// Result: false
```

## Real Examples

Here's what the transformation looks like:

| Platform | Before (Messy) | After (Clean) |
|----------|----------------|---------------|
| **Spotify** | `https://open.spotify.com/track/123?si=abc123&utm_source=email` | `https://open.spotify.com/track/123` |
| **Twitter** | `https://twitter.com/user/status/456?s=20&ref_src=email` | `https://twitter.com/user/status/456` |
| **Instagram** | `https://www.instagram.com/p/789/?igsh=abc123&utm_campaign=social` | `https://www.instagram.com/p/789/` |
| **YouTube** | `https://youtube.com/watch?v=abc123&t=30s&utm_source=email` | `https://youtube.com/watch?v=abc123&t=30s` |

## Platforms We Support

- **Social Media**: Twitter/X, Instagram, Facebook, LinkedIn, Reddit, TikTok, Pinterest
- **Music**: Spotify, Apple Music, YouTube Music, SoundCloud
- **Video**: YouTube, Vimeo, Twitch, TikTok
- **Shopping**: Amazon, eBay, Etsy, Shopify
- **Search**: Google, Bing, DuckDuckGo
- **And 40+ other platforms**

## Performance Notes

- **Speed**: Usually processes URLs in under 1ms
- **Memory**: Very lightweight
- **CPU**: Efficient algorithms that don't hog resources
- **Battery**: Mobile-friendly design

## Privacy & Security

- **Local only**: Everything happens on your device
- **No network calls**: Zero external requests
- **No data collection**: We don't track anything
- **Open source**: You can review the code yourself

## System Requirements

- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Testing

Run the tests to make sure everything works:

```bash
swift test
```

Or get more detailed output:

```bash
swift test --verbose
```

## Contributing

Feel free to contribute! Just submit a Pull Request. For bigger changes, it's good to open an issue first so we can discuss the approach.

## License

MIT License - see the [LICENSE](LICENSE) file for the full details.

```
MIT License

Copyright (c) 2025 Zeynep YILDIZ

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
```



---

**Linkify** - Clean URLs, Keep Your Privacy

