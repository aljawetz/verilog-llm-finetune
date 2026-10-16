`timescale 1ns/1ps

module tb_pci_perr_crit;

    // Inputs
    reg non_critical_par_in;
    reg pci_par_in;
    reg perr_generate_in;

    // Outputs
    wire perr_out;
    wire perr_n_out;

    // Instantiate the Unit Under Test (UUT)
    pci_perr_crit uut (
        .perr_out(perr_out),
        .perr_n_out(perr_n_out),
        .non_critical_par_in(non_critical_par_in),
        .pci_par_in(pci_par_in),
        .perr_generate_in(perr_generate_in)
    );

    initial begin
        // Initialize Inputs
        non_critical_par_in = 0;
        pci_par_in = 0;
        perr_generate_in = 0;

        // Test Case 1: Error generation disabled
        #10;
        if (perr_out !== 0 || perr_n_out !== 1) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: Error generation enabled, both inputs low
        perr_generate_in = 1;
        #10;
        if (perr_out !== 0 || perr_n_out !== 1) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: Error generation enabled, non-critical input high, PCI input low
        non_critical_par_in = 1;
        #10;
        if (perr_out !== 1 || perr_n_out !== 0) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Error generation enabled, non-critical input low, PCI input high
        non_critical_par_in = 0;
        pci_par_in = 1;
        #10;
        if (perr_out !== 1 || perr_n_out !== 0) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: Error generation enabled, both inputs high
        non_critical_par_in = 1;
        #10;
        if (perr_out !== 0 || perr_n_out !== 1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        // Test Case 6: Error generation disabled again
        perr_generate_in = 0;
        #10;
        if (perr_out !== 0 || perr_n_out !== 1) begin
            $display("FAIL: Test Case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule