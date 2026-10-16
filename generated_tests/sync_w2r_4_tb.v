`timescale 1ns/1ps

module tb_sync_w2r;

    reg rclk;
    reg rrst_n;
    reg [3:0] wptr;
    wire [3:0] rq2_wptr;

    // Instantiate the module under test (uut)
    sync_w2r uut (
        .rclk(rclk),
        .rrst_n(rrst_n),
        .wptr(wptr),
        .rq2_wptr(rq2_wptr)
    );

    // Clock generation
    initial begin
        rclk = 0;
        forever #5 rclk = ~rclk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rrst_n = 0; // Assert reset
        wptr = 4'b0000;
        #10; // Wait for 10 ns

        rrst_n = 1; // Deassert reset
        #10; // Wait for 10 ns

        // Test case 1: Check output after reset
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: Output should be 0000 after reset");
            $finish;
        end

        // Test case 2: Write pointer value
        wptr = 4'b1010; // Set wptr to 1010
        #10; // Wait for 10 ns

        // Check output
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: Output should be 0000 before clock edge");
            $finish;
        end

        // Test case 3: Check output after clock edge
        #10; // Wait for clock edge
        if (rq2_wptr !== 4'b1010) begin
            $display("FAIL: Output should be 1010 after clock edge");
            $finish;
        end

        // Test case 4: Change wptr value
        wptr = 4'b1111; // Set wptr to 1111
        #10; // Wait for 10 ns

        // Check output
        #10; // Wait for clock edge
        if (rq2_wptr !== 4'b1111) begin
            $display("FAIL: Output should be 1111 after clock edge");
            $finish;
        end

        // Test case 5: Assert reset again
        rrst_n = 0; // Assert reset
        #10; // Wait for 10 ns

        // Check output after reset
        if (rq2_wptr !== 4'b0000) begin
            $display("FAIL: Output should be 0000 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule