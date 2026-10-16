`timescale 1ns/1ps

module tb_top_module;

    // Output wire from the module
    wire zero;

    // Instantiate the module under test (uut)
    top_module uut (
        .zero(zero)
    );

    initial begin
        // Wait for a short time to observe the output
        #10;

        // Check the output
        if (zero !== 1'b0) begin
            $display("FAIL: Output zero is not as expected");
            $finish;
        end

        // Additional wait to ensure stability
        #10;

        // Final check
        if (zero !== 1'b0) begin
            $display("FAIL: Output zero is not as expected after additional wait");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule