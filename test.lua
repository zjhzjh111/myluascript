function main()
    deviceID = getDeviceID()
    local http = require("socket.http")
    http.TIMEOUT = 20 --设置超时时间
    ret = http.request("http://139.199.59.136:4050/deviceID=" .. deviceID)
    notifyMessage(ret)
    table1 = jsonDecode(ret)
    endtime =
        os.time {
        year = table1.time,
        month = table1.month,
        day = table1.day,
        hour = table1.hour,
        min = table1.min,
        sec = table1.sec
    }
    if endtime > getNetTime() then --结束日期大于现在日期
        notifyMessage("脚本未到期")
    else
        notifyMessage("脚本已到期")
    end
end
