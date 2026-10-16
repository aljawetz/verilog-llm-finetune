`timescale 1ns/1ps

module tb_ipDecoder;

    reg clk;
    reg rst;
    reg [1:0] counter;
    reg [63:0] dataIn;
    wire [3:0] version;
    wire [3:0] headerLength;
    wire [7:0] typeOfService;
    wire [15:0] totalLength;
    wire [15:0] identification;
    wire [2:0] flags;
    wire [12:0] fragmentOffset;
    wire [7:0] timeToLive;
    wire [7:0] protocol;
    wire [15:0] headerChecksum;
    wire [31:0] srcIPAddress;
    wire [31:0] destIPAddress;

    ipDecoder uut (
        .clk(clk),
        .rst(rst),
        .counter(counter),
        .dataIn(dataIn),
        .version(version),
        .headerLength(headerLength),
        .typeOfService(typeOfService),
        .totalLength(totalLength),
        .identification(identification),
        .flags(flags),
        .fragmentOffset(fragmentOffset),
        .timeToLive(timeToLive),
        .protocol(protocol),
        .headerChecksum(headerChecksum),
        .srcIPAddress(srcIPAddress),
        .destIPAddress(destIPAddress)
    );

    initial begin
        clk = 0;
        rst = 1;
        counter = 0;
        dataIn = 0;
        #5 rst = 0;

        // Test Case 1: Decode first segment
        counter = 2;
        dataIn = 64'hA0B0C0D0E0F0A1B2; // version=10, headerLength=0, typeOfService=0C, totalLength=0D0E, identification=0F0A, flags=0B, fragmentOffset=0C0D
        #10;
        if (version !== 4'hA) $display("FAIL: version mismatch");
        if (headerLength !== 4'h0) $display("FAIL: headerLength mismatch");
        if (typeOfService !== 8'h0C) $display("FAIL: typeOfService mismatch");
        if (totalLength !== 16'hD0E) $display("FAIL: totalLength mismatch");
        if (identification !== 16'hF0A) $display("FAIL: identification mismatch");
        if (flags !== 3'h0B) $display("FAIL: flags mismatch");
        if (fragmentOffset !== 13'hC0D) $display("FAIL: fragmentOffset mismatch");

        // Test Case 2: Decode second segment
        counter = 3;
        dataIn = 64'h00000000A0B0; // timeToLive=0, protocol=0A, headerChecksum=0B0
        #10;
        if (timeToLive !== 8'h00) $display("FAIL: timeToLive mismatch");
        if (protocol !== 8'h0A) $display("FAIL: protocol mismatch");
        if (headerChecksum !== 16'hB0) $display("FAIL: headerChecksum mismatch");
        if (srcIPAddress !== 32'h00000000) $display("FAIL: srcIPAddress mismatch");

        // Test Case 3: Decode third segment
        counter = 4;
        dataIn = 64'hC0A80001; // destIPAddress=192.168.0.1
        #10;
        if (destIPAddress !== 32'hC0A80001) $display("FAIL: destIPAddress mismatch");

        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk;

endmodule