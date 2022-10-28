module BankAccount
    ( BankAccount
    , closeAccount
    , getBalance
    , incrementBalance
    , openAccount
    ) where
import Control.Concurrent.STM (TVar, newTVarIO, writeTVar, swapTVar, atomically, readTVarIO)

data PureBankAccount = OpenAccount Integer | ClosedAccount
type BankAccount = TVar PureBankAccount

closeAccount :: BankAccount -> IO ()
closeAccount account = do
    atomically $ writeTVar account ClosedAccount
    return ()

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance account = do
    wrapped <- readTVarIO account
    case wrapped of
        (OpenAccount balance) -> return $ Just balance
        ClosedAccount -> return Nothing

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = do
    wrapped <- readTVarIO account
    case wrapped of
        (OpenAccount balance) -> do
            _ <- atomically $ swapTVar account (OpenAccount $ amount + balance)
            getBalance account
        ClosedAccount -> return Nothing


openAccount :: IO BankAccount
openAccount =  newTVarIO $ OpenAccount 0
