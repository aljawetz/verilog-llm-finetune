`timescale 1ns/1ps

module tb_pci_serr_en_crit;

    reg non_critical_par_in;
    reg pci_par_in;
    reg serr_generate_in;
    wire serr_en_out;

    // Instantiate the module under test (uut)
    pci_serr_en_crit uut (
        .serr_en_out(serr_en_out),
        .non_critical_par_in(non_critical_par_in),
        .pci_par_in(pci_par_in),
        .serr_generate_in(serr_generate_in)
    );

    initial begin
        // Test case 1: SERR generated, parity mismatch
        non_critical_par_in = 1'b0;
        pci_par_in = 1'b1;
        serr_generate_in = 1'b1;
        #10;
        if (serr_en_out !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected serr_en_out = 1, got %b", serr_en_out);
            $finish;
        end

        // Test case 2: SERR generated, parity match
        non_critical_par_in = 1'b1;
        pci_par_in = 1'b1;
        serr_generate_in = 1'b1;
        #10;
        if (serr_en_out !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected serr_en_out = 0, got %b", serr_en_out);
            $finish;
        end

        // Test case 3: No SERR generated
        non_critical_par_in = 1'b0;
        pci_par_in = 1'b0;
        serr_generate_in = 1'b0;
        #10;
        if (serr_en_out !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected serr_en_out = 0, got %b", serr_en_out);
            $finish;
        end

        // Test case 4: SERR generated, parity mismatch
        non_critical_par_in = 1'b1;
        pci_par_in = 1'b0;
        serr_generate_in = 1'b1;
        #10;
        if (serr_en_out !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected serr_en_out = 1, got %b", serr_en_out);
            $finish;
        end

        // Test case 5: SERR generated, parity match
        non_critical_par_in = 1'b0;
        pci_par_in = 1'b0;
        serr_generate_in = 1'b1;
        #10;
        if (serr_en_out !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected serr_en_out = 0, got %b", serr_en_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule