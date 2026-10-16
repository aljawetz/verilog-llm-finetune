`timescale 1ns/1ps

module tb_top_module;

    reg [2:0] vec;
    wire [2:0] outv;
    wire o2, o1, o0;

    // Instantiate the module under test
    top_module uut (
        .vec(vec),
        .outv(outv),
        .o2(o2),
        .o1(o1),
        .o0(o0)
    );

    initial begin
        // Test case 1: Check for vec = 3'b000
        vec = 3'b000;
        #10;
        if (outv !== 3'b000 || o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b0) begin
            $display("FAIL: Test case 1 failed for vec = 3'b000");
            $finish;
        end

        // Test case 2: Check for vec = 3'b001
        vec = 3'b001;
        #10;
        if (outv !== 3'b001 || o0 !== 1'b1 || o1 !== 1'b0 || o2 !== 1'b0) begin
            $display("FAIL: Test case 2 failed for vec = 3'b001");
            $finish;
        end

        // Test case 3: Check for vec = 3'b010
        vec = 3'b010;
        #10;
        if (outv !== 3'b010 || o0 !== 1'b0 || o1 !== 1'b1 || o2 !== 1'b0) begin
            $display("FAIL: Test case 3 failed for vec = 3'b010");
            $finish;
        end

        // Test case 4: Check for vec = 3'b011
        vec = 3'b011;
        #10;
        if (outv !== 3'b011 || o0 !== 1'b1 || o1 !== 1'b1 || o2 !== 1'b0) begin
            $display("FAIL: Test case 4 failed for vec = 3'b011");
            $finish;
        end

        // Test case 5: Check for vec = 3'b100
        vec = 3'b100;
        #10;
        if (outv !== 3'b100 || o0 !== 1'b0 || o1 !== 1'b0 || o2 !== 1'b1) begin
            $display("FAIL: Test case 5 failed for vec = 3'b100");
            $finish;
        end

        // Test case 6: Check for vec = 3'b101
        vec = 3'b101;
        #10;
        if (outv !== 3'b101 || o0 !== 1'b1 || o1 !== 1'b0 || o2 !== 1'b1) begin
            $display("FAIL: Test case 6 failed for vec = 3'b101");
            $finish;
        end

        // Test case 7: Check for vec = 3'b110
        vec = 3'b110;
        #10;
        if (outv !== 3'b110 || o0 !== 1'b0 || o1 !== 1'b1 || o2 !== 1'b1) begin
            $display("FAIL: Test case 7 failed for vec = 3'b110");
            $finish;
        end

        // Test case 8: Check for vec = 3'b111
        vec = 3'b111;
        #10;
        if (outv !== 3'b111 || o0 !== 1'b1 || o1 !== 1'b1 || o2 !== 1'b1) begin
            $display("FAIL: Test case 8 failed for vec = 3'b111");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule