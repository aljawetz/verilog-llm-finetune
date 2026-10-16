`timescale 1ns/1ps

module tb_msrv32_reg_block_1;

    reg clk_in;
    reg rst_in;
    reg [31:0] pc_mux_in;
    wire [31:0] pc_out;

    // Instantiate the module under test (uut)
    msrv32_reg_block_1 uut (
        .clk_in(clk_in),
        .rst_in(rst_in),
        .pc_mux_in(pc_mux_in),
        .pc_out(pc_out)
    );

    // Clock generation
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_in = 1;
        pc_mux_in = 32'h00000000;

        // Wait for a clock edge
        #10;

        // Assert reset behavior
        if (pc_out !== 32'h00000000) begin
            $display("FAIL: Reset did not load boot address");
            $finish;
        end

        // Release reset
        rst_in = 0;
        pc_mux_in = 32'h00000001;

        // Wait for a clock edge
        #10;

        // Assert output after first clock edge
        if (pc_out !== 32'h00000001) begin
            $display("FAIL: Output did not update to pc_mux_in after reset");
            $finish;
        end

        // Change pc_mux_in and check output
        pc_mux_in = 32'h00000002;
        #10;

        // Assert output after second clock edge
        if (pc_out !== 32'h00000002) begin
            $display("FAIL: Output did not update to new pc_mux_in");
            $finish;
        end

        // Change pc_mux_in again
        pc_mux_in = 32'h00000003;
        #10;

        // Assert output after third clock edge
        if (pc_out !== 32'h00000003) begin
            $display("FAIL: Output did not update to new pc_mux_in");
            $finish;
        end

        // Test reset again
        rst_in = 1;
        #10;

        // Assert reset behavior again
        if (pc_out !== 32'h00000000) begin
            $display("FAIL: Reset did not load boot address again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule