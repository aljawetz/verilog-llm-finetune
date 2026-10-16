`timescale 1ns/1ps

module tb_dff;

    reg d, set, reset, clk;
    wire q, qbar;

    // Instantiate the D Flip-Flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .d(d),
        .set(set),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0; set = 1; reset = 1;

        // Test reset functionality
        reset = 0; // Activate reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        reset = 1; // Deactivate reset
        #10;

        // Test set functionality
        set = 0; // Activate set
        #10;
        if (q !== 1) begin
            $display("FAIL: Set did not set q to 1");
            $finish;
        end
        
        set = 1; // Deactivate set
        #10;

        // Test normal operation
        d = 1; // Set d to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: q did not follow d when set and reset are inactive");
            $finish;
        end

        d = 0; // Set d to 0
        #10; // Wait for clock edge
        if (q !== 0) begin
            $display("FAIL: q did not follow d when set and reset are inactive");
            $finish;
        end

        // Test reset again
        reset = 0; // Activate reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        reset = 1; // Deactivate reset
        #10;

        // Test set again
        set = 0; // Activate set
        #10;
        if (q !== 1) begin
            $display("FAIL: Set did not set q to 1");
            $finish;
        end
        
        // End of test
        $display("PASS");
        $finish;
    end

endmodule