`timescale 1ns/1ps

module tb_Sign_Extend;

    reg [11:0] data0_i;
    reg [11:0] data1_i;
    reg select_i;
    wire [31:0] data_o;

    // Instantiate the module under test (uut)
    Sign_Extend uut (
        .data0_i(data0_i),
        .data1_i(data1_i),
        .select_i(select_i),
        .data_o(data_o)
    );

    initial begin
        // Test case 1: Select data0_i with positive value
        data0_i = 12'b000000000001; // 1 in decimal
        data1_i = 12'b000000000010; // 2 in decimal
        select_i = 0;
        #10;
        if (data_o !== 32'b00000000000000000000000000000001) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Select data0_i with negative value
        data0_i = 12'b111111111111; // -1 in decimal
        data1_i = 12'b000000000010; // 2 in decimal
        select_i = 0;
        #10;
        if (data_o !== 32'b11111111111111111111111111111111) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Select data1_i with positive value
        data0_i = 12'b000000000001; // 1 in decimal
        data1_i = 12'b000000000010; // 2 in decimal
        select_i = 1;
        #10;
        if (data_o !== 32'b00000000000000000000000000000010) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Select data1_i with negative value
        data0_i = 12'b000000000001; // 1 in decimal
        data1_i = 12'b111111111111; // -1 in decimal
        select_i = 1;
        #10;
        if (data_o !== 32'b11111111111111111111111111111111) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Select data0_i with zero
        data0_i = 12'b000000000000; // 0 in decimal
        data1_i = 12'b000000000010; // 2 in decimal
        select_i = 0;
        #10;
        if (data_o !== 32'b00000000000000000000000000000000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Select data1_i with zero
        data0_i = 12'b000000000000; // 0 in decimal
        data1_i = 12'b000000000000; // 0 in decimal
        select_i = 1;
        #10;
        if (data_o !== 32'b00000000000000000000000000000000) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule