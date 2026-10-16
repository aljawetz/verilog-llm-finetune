`timescale 1ns/1ps

module tb_top_module;

    // Output wire from the module under test
    wire zero;

    // Instantiate the module under test
    top_module uut (
        .zero(zero)
    );

    // Test procedure
    initial begin
        // Wait for a short time to allow the module to initialize
        #10;

        // Check the output value
        if (zero !== 1'b0) begin
            $display("FAIL: Output zero is not 0");
            $finish;
        end

        // If the output is as expected
        $display("PASS");
        $finish;
    end

endmodule