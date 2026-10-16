`timescale 1ns/1ps

module tb_mux8x1_with_en;

    reg en;
    reg [2:0] s;
    reg [7:0] datain;
    wire dataout;

    // Instantiate the module under test (uut)
    mux8x1_with_en uut (
        .en(en),
        .s(s),
        .datain(datain),
        .dataout(dataout)
    );

    initial begin
        // Test case 1: Enable is low, select input 0
        en = 0; s = 3'd0; datain = 8'b10101010; #10;
        if (dataout !== datain[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", datain[0], dataout);

        // Test case 2: Enable is low, select input 1
        s = 3'd1; #10;
        if (dataout !== datain[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", datain[1], dataout);

        // Test case 3: Enable is low, select input 2
        s = 3'd2; #10;
        if (dataout !== datain[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", datain[2], dataout);

        // Test case 4: Enable is low, select input 3
        s = 3'd3; #10;
        if (dataout !== datain[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", datain[3], dataout);

        // Test case 5: Enable is low, select input 4
        s = 3'd4; #10;
        if (dataout !== datain[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", datain[4], dataout);

        // Test case 6: Enable is low, select input 5
        s = 3'd5; #10;
        if (dataout !== datain[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", datain[5], dataout);

        // Test case 7: Enable is low, select input 6
        s = 3'd6; #10;
        if (dataout !== datain[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", datain[6], dataout);

        // Test case 8: Enable is low, select input 7
        s = 3'd7; #10;
        if (dataout !== datain[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", datain[7], dataout);

        // Test case 9: Enable is high
        en = 1; s = 3'd0; datain = 8'b10101010; #10;
        if (dataout !== 0) $display("FAIL: Test case 9 failed, expected 0, got %b", dataout);

        // If all assertions passed
        $display("PASS");
        $finish;
    end

endmodule