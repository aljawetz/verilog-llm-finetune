`timescale 1ns/1ps

module tb_pci_serr_crit;

    // Inputs
    reg non_critical_par_in;
    reg pci_par_in;
    reg serr_check_in;

    // Outputs
    wire serr_out;

    // Instantiate the Unit Under Test (UUT)
    pci_serr_crit uut (
        .serr_out(serr_out),
        .non_critical_par_in(non_critical_par_in),
        .pci_par_in(pci_par_in),
        .serr_check_in(serr_check_in)
    );

    initial begin
        // Test case 1: All inputs low
        non_critical_par_in = 0;
        pci_par_in = 0;
        serr_check_in = 0;
        #10;
        if (serr_out !== 1) $display("FAIL: Test case 1 failed, expected serr_out = 1, got %b", serr_out);

        // Test case 2: serr_check_in high, non_critical_par_in low, pci_par_in low
        serr_check_in = 1;
        #10;
        if (serr_out !== 0) $display("FAIL: Test case 2 failed, expected serr_out = 0, got %b", serr_out);

        // Test case 3: serr_check_in high, non_critical_par_in low, pci_par_in high
        pci_par_in = 1;
        #10;
        if (serr_out !== 0) $display("FAIL: Test case 3 failed, expected serr_out = 0, got %b", serr_out);

        // Test case 4: serr_check_in high, non_critical_par_in high, pci_par_in low
        non_critical_par_in = 1;
        pci_par_in = 0;
        #10;
        if (serr_out !== 0) $display("FAIL: Test case 4 failed, expected serr_out = 0, got %b", serr_out);

        // Test case 5: serr_check_in high, non_critical_par_in high, pci_par_in high
        pci_par_in = 1;
        #10;
        if (serr_out !== 1) $display("FAIL: Test case 5 failed, expected serr_out = 1, got %b", serr_out);

        // Test case 6: serr_check_in low, non_critical_par_in high, pci_par_in low
        serr_check_in = 0;
        non_critical_par_in = 1;
        pci_par_in = 0;
        #10;
        if (serr_out !== 1) $display("FAIL: Test case 6 failed, expected serr_out = 1, got %b", serr_out);

        // Test case 7: serr_check_in low, non_critical_par_in low, pci_par_in high
        non_critical_par_in = 0;
        pci_par_in = 1;
        #10;
        if (serr_out !== 1) $display("FAIL: Test case 7 failed, expected serr_out = 1, got %b", serr_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule