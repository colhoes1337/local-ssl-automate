# Local SSL Automate

**Automate SSL certificate trust for Local by Flywheel (Local WP) on macOS with one simple command.**

Stop manually trusting SSL certificates in Keychain Access! This script handles everything automatically: trusts certificates, updates database URLs, and gets your Local WordPress sites running on HTTPS in seconds.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS-10.15+-blue.svg)](https://www.apple.com/macos/)
[![Local](https://img.shields.io/badge/Local-6.0+-green.svg)](https://localwp.com/)

## 🎯 What This Solves

When using [Local by Flywheel](https://localwp.com/) on macOS, you often need to:

1. Click "Trust" in Local
2. Open Keychain Access app
3. Find the certificate
4. Change trust settings to "Always Trust"
5. Update WordPress database URLs from HTTP to HTTPS

This script does ALL of that automatically with one command: `trustssl`

## ✨ Features

-   ✅ **Automatic SSL certificate trust** - No more Keychain Access manual steps
-   ✅ **Database URL updates** - Automatically converts HTTP to HTTPS in WordPress
-   ✅ **Smart domain detection** - Auto-detects your site domain from WordPress
-   ✅ **Error checking** - Clear messages if something goes wrong
-   ✅ **macOS optimized** - Works with macOS Monterey, Ventura, Sonoma, and later

## 🚀 Quick Start

### Installation (5 minutes)

1. **Download the script:**

    ```bash
    curl -o ~/Downloads/trust-local-ssl.sh https://raw.githubusercontent.com/SirajumMahdi/local-ssl-automate/main/trust-local-ssl.sh
    ```

2. **Install it:**

    ```bash
    chmod +x ~/Downloads/trust-local-ssl.sh
    mkdir -p ~/bin
    mv ~/Downloads/trust-local-ssl.sh ~/bin/
    ```

3. **Create the alias:**

    Add this line to your `~/.zshrc` file:

    ```bash
    alias trustssl='~/bin/trust-local-ssl.sh'
    ```

    Then reload your shell:

    ```bash
    source ~/.zshrc
    ```

### Usage

**Every time you create a new Local site or need to enable SSL:**

1. Open **Local by Flywheel**
2. Click the **"Trust"** button (next to SSL in Site Overview)
3. Right-click your site → **"Open Site Shell"**
4. Run this command:
    ```bash
    trustssl
    ```
5. Enter your Mac password when prompted
6. Done! ✅

That's it! Your site now works with HTTPS and the 🔒 lock icon appears in your browser.

## 📋 Requirements

-   macOS 10.15 (Catalina) or later
-   [Local by Flywheel](https://localwp.com/) installed
-   Administrator access (for trusting certificates)

## 🎥 Video Tutorial

[Coming soon - Watch how to install and use this script]

## 💡 How It Works

The script performs three steps automatically:

1. **Finds your certificate** - Locates the SSL certificate Local created for your site
2. **Trusts it in Keychain** - Uses macOS `security` command to add certificate to System Keychain with "Always Trust" setting
3. **Updates WordPress** - Uses WP-CLI to replace all HTTP URLs with HTTPS in your database

All of this happens in ~5 seconds instead of several minutes of manual work.

## 🐛 Troubleshooting

### "Certificate not found" error

**Solution:** Make sure you clicked the "Trust" button in Local before running the script.

### "Must be run from Local's Open Site Shell"

**Solution:** Don't run in regular Terminal. Use Local's "Open Site Shell" option (right-click site → Open Site Shell).

### Browser still shows "Not Secure"

**Solutions:**

-   Hard refresh: `Cmd + Shift + R`
-   Clear browser cache
-   Restart browser completely
-   Check that URL starts with `https://` not `http://`

### "Command not found: trustssl"

**Solution:** Make sure you added the alias to `~/.zshrc` and ran `source ~/.zshrc`

## 🔒 Security

This script only:

-   Trusts SSL certificates created by Local for `.local` domains
-   Updates URLs in your local WordPress database
-   Requires your password (via `sudo`) to modify System Keychain

**It does NOT:**

-   Send any data over the internet
-   Access external sites or services
-   Modify system files beyond the Keychain
-   Affect production/live websites

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/SirajumMahdi/local-ssl-automate/issues).

## 📝 License

MIT License - feel free to use this in your own projects!

## 🙏 Credits

Created by [Sirajum Mahdi](https://sirajummahdi.com/) with assistance from [Claude](https://claude.ai/) to simplify the process documented in [Local's official SSL guide](https://localwp.com/help-docs/getting-started/managing-local-sites-ssl-certificate-in-macos/).

## ⭐ Show Your Support

If this script saved you time, please give it a star on GitHub! It helps others discover this tool.

## 📚 Related Resources

-   [Local by Flywheel Official Site](https://localwp.com/)
-   [Local Documentation](https://localwp.com/help-docs/)
-   [WordPress SSL Best Practices](https://wordpress.org/support/article/https-for-wordpress/)
-   [macOS Keychain Access Guide](https://support.apple.com/guide/keychain-access/)

## 📞 Support

-   **Issues:** [GitHub Issues](https://github.com/SirajumMahdi/local-ssl-automate/issues)
-   **Questions:** [GitHub Discussions](https://github.com/SirajumMahdi/local-ssl-automate/discussions)
-   **Local Community:** [Local Community Forums](https://community.localwp.com/)
-   **Author:** [Sirajum Mahdi](https://sirajummahdi.com/)
