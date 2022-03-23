 public double GetBalance(string address)
    {
        double balance = 0;
        foreach (Block block in Chain)
        {
            foreach (Transaction transaction in block.Transactions)
            {
                if (transaction.From == address)
                {
                    balance -= transaction.Amount;
                }
                if (transaction.To == address)
                {
                    balance += transaction.Amount;
                }
