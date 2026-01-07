const fs = require('fs');
const path = require('path');

const sessionDir = path.join(__dirname, 'session');

console.log('🗑️  Resetting session...');

if (fs.existsSync(sessionDir)) {
    try {
        fs.rmSync(sessionDir, { recursive: true, force: true });
        console.log('✅ Session folder deleted successfully.');
        console.log('🔄 Restart the bot to download a fresh session.');
    } catch (error) {
        console.error('❌ Error deleting session folder:', error.message);
    }
} else {
    console.log('ℹ️  No session folder found. You are ready to start fresh.');
}
