# Changelog

All notable changes to the **Deva Gaming Services** project will be documented in this file.

## [2025-11-22] - UI Optimization & Layout Fixes

### Added
- **High-Performance Search:** Implemented a debounced search input with `<datalist>` history tracking across all console pages.
- **Voice Search API:** Added a microphone button allowing users to search for games using speech-to-text.
- **Dynamic Grid UI:** Added a Grid Size selector dropdown (Small, Medium, Large) using CSS variables.
- **Randomizer:** Added a "🎲 Random" button to instantly pick and search a random game from the current list.
- **Perceived Performance:** Implemented animated skeleton loading cards that display before the CSV data is fully parsed.
- **Custom Context Menu:** Replaced the default right-click menu with a custom UI to "Play on YouTube".
- **Progress & Sticky Controls:** Added a sticky search header with a neon-blue scroll progress bar attached to the top of the viewport.
- **Mobile Scroll Collapse:** Added JavaScript/CSS logic to automatically hide the filter chips and action buttons when scrolling down on Android/mobile, maximizing screen space.
- **Haptic Feedback:** Added `navigator.vibrate` integration for Android devices to provide physical feedback when clicking cards or buttons.
- **Keyboard Accessibility:** Added Arrow-Key grid navigation and a `/` hotkey to instantly focus the search bar.

### Changed
- Updated the footer copyright year to 2026 across all HTML pages.
- Renamed quick-filter chips for better readability ("GTA" is now "Grand Theft Auto", "Spider-Man" is now "Spider Man").
- Improved mobile responsiveness in `.header` to prevent title text from wrapping onto a second line on narrow Android screens.
- Optimized top header layout by removing excessive padding and absolutely positioning the hamburger menu, reclaiming over 100px of vertical space.

### Fixed
- Repaired file corruption and missing HTML/JavaScript logic in `ps5.html` and `xbox.html` to restore search and infinite scroll functionality.
- Fixed a bug where clearing the search bar with backspace prevented the library from reloading due to a stuck `isLoading` state.

### Removed
- Streamlined the UI by removing several bulky business features upon request:
  - Removed Portfolio Valuation ($) display.
  - Removed PWA Install Prompt and Notification Bell.
  - Removed OLED true-black mode, Lite (Data Saver) mode, and Favorites/Wishlist toggles.
  - Removed "🔥 HOT" trending badges and Exact Match checkbox.