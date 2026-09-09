package vn.iotstar.util;

import java.io.File;

import org.apache.commons.fileupload.FileItem;

public class ImageUploadHelper {

    public static String save(FileItem item, String localSubFolder, String cloudFolder) throws Exception {
        if (item == null || item.getSize() <= 0) {
            return null;
        }

        String originalFileName = item.getName();
        int index = originalFileName.lastIndexOf(".");
        String ext = index >= 0 ? originalFileName.substring(index + 1) : "jpg";

        if (ImgBBUtil.isConfigured()) {
            File tempFile = File.createTempFile("upload_", "." + ext);
            tempFile.delete(); 
            try {
                item.write(tempFile);
                return ImgBBUtil.upload(tempFile);
            } finally {
                tempFile.delete();
            }
        }

        String fileName = System.currentTimeMillis() + "." + ext;
        File dir = new File(Constant.DIR + "/" + localSubFolder + "/");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File file = new File(dir, fileName);
        item.write(file);
        return localSubFolder + "/" + fileName;
    }
}
