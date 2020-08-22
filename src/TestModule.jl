module TestModule
#version = "0.1.1 from 19-08-2020 21:30" on Julia version 1.5.0

    using BitblinxData
    using CryptoCompareData

    uplBitb(timer) = BitblinxData.uplBitblinx(dsn="DB_TST1")
    uplCrypM(timer) =  CryptoCompareData.uplCrypCom(dsn="DB_TST2")
    uplCrypH(timer) = CryptoCompareData.uplCrypCom(dsn="DB_TST3",hrmin="hour")

    t1= Timer(uplBitb, 2, interval=600)
    t2= Timer(uplCrypM, 30, interval=900)
    t3= Timer(uplCrypH, 500, interval=3600)

end #Module TestModule
