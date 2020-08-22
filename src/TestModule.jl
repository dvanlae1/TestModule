module TestModule
    #version = "0.1.1 from 19-08-2020 21:30" on Julia version 1.5.0
    #cd("C:/Users/Dirk/.julia/dev/TestModule")

    using BitblinxData
    using CryptoCompareData

    function julia_main()
        try
            uplBitb(timer) = BitblinxData.uplBitblinx(dsn="DB_TST1")
        catch err
            println("Error by uplBitb timer: $err")
        end
        try
            uplCrypM(timer) =  CryptoCompareData.uplCrypCom(dsn="DB_TST2")
        catch err
            println("Error by uplCrypM timer: $err")
        end
        try
            uplCrypH(timer) = CryptoCompareData.uplCrypCom(dsn="DB_TST3",hrmin="hour")
        catch
            println("Error by uplCrypH timer: $err")
        end

        t1= Timer(uplBitb, 2, interval=600)
        t2= Timer(uplCrypM, 30, interval=900)
        t3= Timer(uplCrypH, 500, interval=3600)

        if isopen(t1)
            println("Timer 1  is running")
        end
        if isopen(t2)
            println("Timer 2  is running")
        end
        if isopen(t3)
            println("Timer 3  is running")
        end
    end

end #Module TestModule
