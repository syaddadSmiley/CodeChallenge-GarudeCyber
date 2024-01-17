
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Desktop styles */
        .redeem-container {
            max-width: 600px;
            margin: 0 auto;
        }

        /* Mobile styles */
        @media only screen and (max-width: 600px) {
            .redeem-container {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="redeem-container">
        <h1>Redeem Voucher</h1>
        <?php if (isset($error)): ?>
             <p style="color: red"><?= $error['error'] ?></p>
        <?php endif; ?>
        <?php if (isset($success)): ?>
             <p style="color: green"><?= $success['success'] ?></p>
        <?php endif; ?>

        <form action="/redeem" method="POST">
            <label for="voucher-code">Voucher Code:</label>
            <input type="text" id="voucher-code" name="voucher-code" required>

            <label for="tenant-option">Tenant Option:</label>
            <select id="tenant-option" name="tenant-option" required>
                <?php foreach ($tenants as $tenant): ?>
                    <option value="<?= $tenant['id'] ?>"><?= $tenant['name'] ?></option>
                <?php endforeach; ?>
            </select>

            <button type="submit">Redeem</button>
        </form>
    </div>
</body>
</html>
