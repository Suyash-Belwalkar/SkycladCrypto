# SkycladCrypto

## Setup Instructions

1. **Requirements**
    - Xcode 13 or later
    - macOS 12.0 or later
    - Swift 5.5 or later

2. **Clone the Repository**
    ```zsh
    git clone https://github.com/Suyash-Belwalkar/SkycladCrypto
    cd SkycladCrypto
    ```

3. **Open in Xcode**
    - Double-click `SkycladCrypto.xcodeproj` or open the folder in Xcode.

4. **Build & Run**
    - Select a simulator or your device. (Use physical iPhone for haptics)
    - Click the Run button (▶️) in Xcode.

5. **Assets**
    - All required images and icons are included in `Assets.xcassets`.

---

## Screenshots / Screen Recording

### Dashboard View  
| Light Mode | Dark Mode |
|------------|-----------|
| <img width="300" alt="Dashboard – Light Mode" src="https://github.com/user-attachments/assets/66392b8f-85c2-43eb-92b0-aa5a21baca9b" /> | <img width="300" alt="Dashboard – Dark Mode" src="https://github.com/user-attachments/assets/bbf76480-6892-49be-ab18-77dce7cded8f" /> |

---

### Exchange View  
| Light Mode | Dark Mode |
|------------|-----------|
| <img width="300" alt="Exchange – Light Mode" src="https://github.com/user-attachments/assets/6c0fa73d-a1ff-4163-b031-6a2ccc4d6c12" /> | <img width="300" alt="Exchange – Dark Mode" src="https://github.com/user-attachments/assets/d6481ce4-6034-4853-b9e0-1ef269c8ab90" /> |


---

### Swap View  
| Light Mode | Dark Mode |
|------------|-----------|
| <img width="300" alt="Swap – Light Mode" src="https://github.com/user-attachments/assets/d060cc4c-3f4a-4625-8ce4-12321ab08ff4" /> | <img width="300" alt="Swap – Dark Mode" src="https://github.com/user-attachments/assets/6586bd81-8bf2-41bf-96ea-09929f0ed689" /> |

---
## Deliverables

### Portfolio Dashboard Screen
- ✅ Portfolio value header with toggle (INR, crypto, etc.)
- ✅ Time selector (1h, 8h, 1d, etc.)
- ✅ Graph with portfolio trend (mock data)
- ✅ Asset cards for BTC, ETH (with price, delta)
- ✅ Recent Transactions (Receive, Sent, etc.)

### Transactions Summary Screen
- ✅ Large portfolio value card
- ✅ Send/Receive/Exchange (+) button group
- ✅ List of transactions with date, type, and token

### Exchange Screen
- ✅ Swap UI for selecting tokens/currencies (ETH/INR, with swap button)
- ✅ Entry fields for amount and dynamic conversion
- ✅ Summary of rate, spread, gas fee, and receivable
- ✅ “Exchange” action button

### Bottom Navigation Bar
- ✅ Nav bar as per design: graph, swap, assets, profile, etc.
- ✅ Highlight selected tab, ❌ glass effect (if possible)

### General
- ✅ All screens support both light and dark mode (dark mode prioritized)
- ✅ Used mock data for portfolio value, rates, transactions
- ✅ Navigation between screens is fully functional

---

## Known Limitations / Areas for Improvement

1. **Glass effect for nav bar**
    - This design implementation will be possible to implement after the official release of iOS 26 (liquid glass).
    - It can be achieved with a single modifier `.glass()`.

---

## Bonus Implementations

- ✅ Animated graph transitions(Run the app in simulator or device)
- ✅ Haptic feedback added to navbar
- ✅ Responsive for iPhone 12mini and above

---


