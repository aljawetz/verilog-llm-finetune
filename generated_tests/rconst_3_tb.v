`timescale 1ns/1ps

module tb_rconst;

    reg [23:0] i;
    wire [63:0] rc;

    // Instantiate the module under test
    rconst uut (
        .i(i),
        .rc(rc)
    );

    initial begin
        // Test case 1: All bits set to 0
        i = 24'b000000000000000000000000;
        #10;
        if (rc !== 64'b0000000000000000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: All bits set to 1
        i = 24'b111111111111111111111111;
        #10;
        if (rc[0] !== 1 || rc[1] !== 1 || rc[3] !== 1 || rc[7] !== 1 || 
            rc[15] !== 1 || rc[31] !== 1 || rc[63] !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Random pattern
        i = 24'b101010101010101010101010;
        #10;
        if (rc[0] !== 1 || rc[1] !== 1 || rc[3] !== 1 || rc[7] !== 1 || 
            rc[15] !== 1 || rc[31] !== 1 || rc[63] !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Specific pattern
        i = 24'b110011001100110011001100;
        #10;
        if (rc[0] !== 1 || rc[1] !== 1 || rc[3] !== 1 || rc[7] !== 1 || 
            rc[15] !== 1 || rc[31] !== 1 || rc[63] !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Edge case with only one bit set
        i = 24'b000000000000000000000001;
        #10;
        if (rc[0] !== 1 || rc[1] !== 0 || rc[3] !== 0 || rc[7] !== 0 || 
            rc[15] !== 0 || rc[31] !== 0 || rc[63] !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule