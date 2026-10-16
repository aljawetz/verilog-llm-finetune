`timescale 1ns/1ps

module tb_pci_par_crit;

    reg par_out_in;
    reg pci_cbe_en_in;
    reg data_par_in;
    reg [3:0] pci_cbe_in;
    wire par_out;

    // Instantiate the module under test (uut)
    pci_par_crit uut (
        .par_out(par_out),
        .par_out_in(par_out_in),
        .pci_cbe_en_in(pci_cbe_en_in),
        .data_par_in(data_par_in),
        .pci_cbe_in(pci_cbe_in)
    );

    initial begin
        // Test case 1: Check when pci_cbe_en_in is 1 (output should be par_out_in)
        pci_cbe_en_in = 1;
        par_out_in = 1; // Expect par_out to be 1
        data_par_in = 0;
        pci_cbe_in = 4'b0000;
        #10;
        if (par_out !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Check when pci_cbe_en_in is 1 (output should be par_out_in)
        par_out_in = 0; // Expect par_out to be 0
        #10;
        if (par_out !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Check when pci_cbe_en_in is 0 (compute parity)
        pci_cbe_en_in = 0;
        data_par_in = 1; // Data parity input
        pci_cbe_in = 4'b1101; // 1^1^0^1^1 = 0 (even parity)
        #10;
        if (par_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Check when pci_cbe_en_in is 0 (compute parity)
        pci_cbe_in = 4'b1010; // 1^0^1^0^1 = 1 (odd parity)
        #10;
        if (par_out !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check with all zero inputs
        pci_cbe_in = 4'b0000; // 0^0^0^0^0 = 0
        data_par_in = 0; // Data parity input
        #10;
        if (par_out !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule