`timescale 1ns/1ps

module tb_jk_latch;

    reg j, k, en, rst;
    wire q, qb;

    // Instantiate the JK latch
    jk_latch uut (
        .j(j),
        .k(k),
        .en(en),
        .rst(rst),
        .q(q),
        .qb(qb)
    );

    initial begin
        // Initialize inputs
        j = 0; k = 0; en = 0; rst = 0;

        // Test sequence
        // Test 1: Reset functionality
        rst = 1; en = 1; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end
        
        // Test 2: Set functionality
        rst = 0; j = 1; k = 0; #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Set did not set q to 1 and qb to 0");
            $finish;
        end
        
        // Test 3: Clear functionality
        j = 0; k = 1; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Clear did not set q to 0 and qb to 1");
            $finish;
        end
        
        // Test 4: Toggle functionality
        j = 1; k = 1; #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Toggle did not set q to 1 and qb to 0");
            $finish;
        end
        
        // Test 5: Hold functionality
        j = 0; k = 0; #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Hold did not maintain q at 1 and qb at 0");
            $finish;
        end
        
        // Test 6: Reset again
        rst = 1; #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule