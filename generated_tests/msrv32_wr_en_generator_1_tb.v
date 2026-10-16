`timescale 1ns/1ps

module tb_msrv32_wr_en_generator;

    // Inputs
    reg flush_in;
    reg rf_wr_en_reg_in;
    reg csr_wr_en_reg_in;

    // Outputs
    wire wr_en_int_file_out;
    wire wr_en_csr_file_out;

    // Instantiate the Unit Under Test (UUT)
    msrv32_wr_en_generator uut (
        .flush_in(flush_in),
        .rf_wr_en_reg_in(rf_wr_en_reg_in),
        .csr_wr_en_reg_in(csr_wr_en_reg_in),
        .wr_en_int_file_out(wr_en_int_file_out),
        .wr_en_csr_file_out(wr_en_csr_file_out)
    );

    initial begin
        // Initialize Inputs
        flush_in = 0;
        rf_wr_en_reg_in = 0;
        csr_wr_en_reg_in = 0;

        // Test Case 1: Normal operation with flush_in low
        rf_wr_en_reg_in = 1;
        csr_wr_en_reg_in = 1;
        #10;
        if (wr_en_int_file_out !== 1'b1) begin
            $display("FAIL: Test Case 1 - wr_en_int_file_out should be 1 when flush_in is low");
            $finish;
        end
        if (wr_en_csr_file_out !== 1'b1) begin
            $display("FAIL: Test Case 1 - wr_en_csr_file_out should be 1 when flush_in is low");
            $finish;
        end

        // Test Case 2: Check outputs when flush_in is high
        flush_in = 1;
        #10;
        if (wr_en_int_file_out !== 1'b0) begin
            $display("FAIL: Test Case 2 - wr_en_int_file_out should be 0 when flush_in is high");
            $finish;
        end
        if (wr_en_csr_file_out !== 1'b0) begin
            $display("FAIL: Test Case 2 - wr_en_csr_file_out should be 0 when flush_in is high");
            $finish;
        end

        // Test Case 3: Check outputs with flush_in low again
        flush_in = 0;
        rf_wr_en_reg_in = 0;
        csr_wr_en_reg_in = 1;
        #10;
        if (wr_en_int_file_out !== 1'b0) begin
            $display("FAIL: Test Case 3 - wr_en_int_file_out should be 0 when flush_in is low and rf_wr_en_reg_in is 0");
            $finish;
        end
        if (wr_en_csr_file_out !== 1'b1) begin
            $display("FAIL: Test Case 3 - wr_en_csr_file_out should be 1 when flush_in is low and csr_wr_en_reg_in is 1");
            $finish;
        end

        // Test Case 4: Check outputs with flush_in high again
        flush_in = 1;
        rf_wr_en_reg_in = 1;
        csr_wr_en_reg_in = 0;
        #10;
        if (wr_en_int_file_out !== 1'b0) begin
            $display("FAIL: Test Case 4 - wr_en_int_file_out should be 0 when flush_in is high");
            $finish;
        end
        if (wr_en_csr_file_out !== 1'b0) begin
            $display("FAIL: Test Case 4 - wr_en_csr_file_out should be 0 when flush_in is high");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule