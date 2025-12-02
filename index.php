<?php
// If the repo already has miniProxy.php, include it.
// Adjust filename if the repo uses a different file name.
if (file_exists(__DIR__ . '/miniProxy.php')) {
    include __DIR__ . '/miniProxy.php';
    exit;
}

// fallback: show a link to the script
echo "<html><body>";
echo "<p>miniProxy not found. Open <a href='miniProxy.php'>miniProxy.php</a></p>";
echo "</body></html>";