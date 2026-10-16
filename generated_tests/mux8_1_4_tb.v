`timescale 1ns/1ps

module tb_mux8_1;

    reg [2:0] s;
    reg [7:0] I;
    wire y;

    // Instantiate the module under test
    mux8_1 uut (
        .s(s),
        .I(I),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        I = 8'b00000001; // I[0] = 1
        s = 3'b000;     // Select I[0]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select input 1
        I = 8'b00000010; // I[1] = 1
        s = 3'b001;     // Select I[1]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

        // Test case 3: Select input 2
        I = 8'b00000100; // I[2] = 1
        s = 3'b010;     // Select I[2]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: Select input 3
        I = 8'b00001000; // I[3] = 1
        s = 3'b011;     // Select I[3]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

        // Test case 5: Select input 4
        I = 8'b00010000; // I[4] = 1
        s = 3'b100;     // Select I[4]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

        // Test case 6: Select input 5
        I = 8'b00100000; // I[5] = 1
        s = 3'b101;     // Select I[5]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

        // Test case 7: Select input 6
        I = 8'b01000000; // I[6] = 1
        s = 3'b110;     // Select I[6]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

        // Test case 8: Select input 7
        I = 8'b10000000; // I[7] = 1
        s = 3'b111;     // Select I[7]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

        // Test case 9: All inputs low
        I = 8'b00000000; // All inputs = 0
        s = 3'b000;     // Select I[0]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 9 failed, expected y=0, got y=%b", y);

        $display("PASS");
        $finish;
    end

endmodule