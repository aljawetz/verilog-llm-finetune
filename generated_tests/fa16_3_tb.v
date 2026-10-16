`timescale 1ns/1ps

module tb_fa16;
    reg [15:0] a, b;
    reg ci;
    wire [15:0] s;
    wire co;

    // Instantiate the module under test (uut)
    fa16 uut (
        .a(a),
        .b(b),
        .ci(ci),
        .s(s),
        .co(co)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 16'h0000; b = 16'h0000; ci = 1'b0;
        #10;
        if (s !== 16'h0000 || co !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 2
        a = 16'h0001; b = 16'h0001; ci = 1'b0;
        #10;
        if (s !== 16'h0002 || co !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 1 + 1 + 1 = 3
        a = 16'h0001; b = 16'h0001; ci = 1'b1;
        #10;
        if (s !== 16'h0003 || co !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Max value + 1
        a = 16'hFFFF; b = 16'h0001; ci = 1'b0;
        #10;
        if (s !== 16'h0000 || co !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Random values
        a = 16'h1234; b = 16'h5678; ci = 1'b0;
        #10;
        if (s !== 16'h68AC || co !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Random values with carry in
        a = 16'h1234; b = 16'h5678; ci = 1'b1;
        #10;
        if (s !== 16'h68AD || co !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: All bits set
        a = 16'hFFFF; b = 16'hFFFF; ci = 1'b1;
        #10;
        if (s !== 16'hFFFF || co !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule